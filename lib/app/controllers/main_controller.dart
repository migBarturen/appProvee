import 'dart:async';
import 'package:app_provee/app/data/models/category_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/models/bank_model.dart';
import '../data/models/product_model.dart';
import '../data/models/slider_model.dart';
import '../data/repository/bank_repository.dart';
import '../data/repository/buy_repository.dart';
import '../data/repository/category_repository.dart';
import '../data/repository/product_repository.dart';
import '../data/repository/slider_repository.dart';
import '../ui/pages/main/main_message_page.dart';
import '../ui/pages/main/main_page.dart';
import '../ui/pages/main/main_payment_information_page.dart';
import '../ui/pages/main/main_payment_method_page.dart';
import '../ui/pages/main/widgets/main_card_product_widget.dart';
import '../ui/themes/helper_theme.dart';
import '../ui/utils/snackbar_util.dart';
import 'global_controller.dart';

class MainController extends GetxController with GetTickerProviderStateMixin {
  final globalController = Get.find<GlobalController>();
  SliderRepository sliderRepository = SliderRepository();
  ProductRepository productRepository = ProductRepository();
  CategoryRepository categoryRepository = CategoryRepository();
  BankRepository bankRepository = BankRepository();
  BuyRepository buyRepository = BuyRepository();

  var activeSliders = <SliderModel>[].obs;
  List listProductViews = <Widget>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<BankModel> bankList = <BankModel>[].obs;
  RxString selectedCategory = ''.obs;
  RxString selectedCity = ''.obs;
  RxString selectedBank = ''.obs;
  RxString selectedBankCCI = ''.obs;
  RxString selectedBankNumber = ''.obs;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchNode = FocusNode();
  RxBool loadingProduct = false.obs;
  RxBool showBadgesProduct = false.obs;
  late AnimationController bodyAnimationController;
  RxInt productQuantity = 1.obs;

  Rx<ProductModel> product = ProductModel().obs;
  RxString paymentMethod = ''.obs;

  final numberTransactionController = TextEditingController();
  FocusNode numberTransactionFocusNode = FocusNode();

  final ImagePicker picker = ImagePicker();

  var selectedImagePath = ''.obs;

  RxString buyCode = ''.obs;
  @override
  void onInit() async {
    bodyAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    super.onInit();
  }

  @override
  void onReady() async {
    await Future.wait([
      getSliders(),
      getProducts(),
      getCategories(),
      getBanks(),
    ]);
  }

  void updateProductQuantity(int data) {
    productQuantity.value = data;
  }

  void updateProduct(ProductModel data) {
    product(data);
  }

  double gain() {
    double gain = (productQuantity.value * product.value.precio!) * 0.05;
    return gain;
  }

  void updatePaymentMethod(String data) {
    paymentMethod.value = data;
  }

  void fileUpload() async {
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      selectedImagePath.value = imageFile.path;
    } else {
      SnackbarUtil().snackbarError('Error', 'Campo imagen no seleccionada.');
    }
  }

  void confirmDeleteDialog() {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: const Center(child: Text('¿Eliminar imágen?')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'los cambios no se guardarán.',
              style: HelperTheme.bodyBlack,
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: HelperTheme().buttonStyleMd(HelperTheme.danger),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Eliminar',
                    style: HelperTheme.buttonText,
                  )
                ],
              ),
              onPressed: () async {
                selectedImagePath.value = '';
                Get.back();
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  Get.back();
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: HelperTheme.info,
                    fontFamily: HelperTheme.fontSource,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
  }

  void mainPage() async {
    productQuantity.value = 1;
    paymentMethod.value = '';

    numberTransactionController.text = '';
    selectedImagePath.value = '';

    Get.to(
      () => const MainPage(),
      transition: Transition.rightToLeftWithFade,
      duration: const Duration(milliseconds: 500),
    );
    await getProducts();
  }

  String? validatorNumberTransaction(String value) {
    if (value.isEmpty) {
      return 'Campo número transaccion es obligatorio.';
    }
    return null;
  }

  Future<void> buyProduct() async {
    if (productQuantity.value == 0) {
      SnackbarUtil().snackbarError(
          'Error', 'Campo cantidad debe de ser mayor o igual a 1');
    } else if (productQuantity.value > product.value.cantidad!) {
      SnackbarUtil()
          .snackbarError('Error', 'Campo cantidad supera al stock disponible');
    } else {
      late String title;
      late String message;

      globalController.updateIsLoading(true);
      try {
        int quantity = productQuantity.value;
        String token = globalController.login.value.token!;
        String usuario = globalController.login.value.id!;

        buyCode.value =
            await buyRepository.setBuy(product.value, quantity, usuario, token);
        updatePaymentMethod('');
        selectedBank.value = '';
        selectedBankNumber.value = '';
        selectedBankCCI.value = '';
        Get.to(
          () => const MainPaymentMethodPage(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 500),
        );
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.updateIsLoading(false);
    }
  }

  void buyInformation(methodFormKey) {
    bool validation = methodFormKey.currentState!.validate();
    if (validation) {
      numberTransactionController.text = '';
      selectedImagePath.value = '';
      Get.to(
        () => const MainPaymentInformationPage(),
        transition: Transition.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
      );
    }
  }

  Future<void> save(informationFormKey) async {
    bool validation = informationFormKey.currentState!.validate();
    late String title;
    late String message;
    numberTransactionFocusNode.unfocus();
    if (validation) {
      globalController.isLoading(true);
      try {
        String id = buyCode.value;
        String method = paymentMethod.value;
        String image = selectedImagePath.value;
        String token = globalController.login.value.token!;
        String date = DateTime.now().toString();
        String numberOperation = numberTransactionController.text;
        String bank = selectedBank.value;

        if (method == 'Yape / Plin' && image == '') {
          SnackbarUtil().snackbarError('Error', 'Campo imagen es obligatorio.');
        } else if (method == 'Yape / Plin') {
          String apps = 'Yape';

          await buyRepository.saveBuyApp(
              id, token, apps, date, numberOperation, image);
          Get.to(
            () => const MainMessagePage(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
          );
        } else {
          await buyRepository.saveBuyBank(
              id, token, bank, date, numberOperation, image);
          Get.to(
            () => const MainMessagePage(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
          );
        }
      } catch (e) {
        title = "Error";
        message = e.toString();
        SnackbarUtil().snackbarError(title, message);
      }
      globalController.isLoading(false);
    }
  }

  Future<void> getCategories() async {
    categoryRepository.getCategories(globalController.login.value.token!).then(
      (categories) {
        categoryList(categories);
      },
    );
  }

  Future<void> getBanks() async {
    bankRepository.getBanks(globalController.login.value.token!).then(
      (banks) {
        bankList(banks);
      },
    );
  }

  Future<void> getSliders() async {
    sliderRepository
        .getSliders(globalController.login.value.token!)
        .then((sliders) {
      activeSliders.value = sliders;
    });
  }

  Future<void> getProducts() async {
    searchNode.unfocus();
    loadingProduct.value = true;
    listProductViews.clear();
    productRepository
        .getProducts(
      globalController.login.value.token!,
      selectedCategory.value,
      searchController.text,
      selectedCity.value,
    )
        .then((products) {
      for (var i = 0; i < products.length; i++) {
        listProductViews.add(
          MainCardProductWidget(data: products[i]),
        );
      }
      loadingProduct.value = false;
      bodyAnimationForward();
    });
  }

  void bodyAnimationForward() {
    bodyAnimationController.forward();
  }

  void filterDialog() {
    Get.dialog(
      AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: const Text('Filtrar por :'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categoría',
              style: HelperTheme.bodyBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField2(
              style: HelperTheme.bodyBlack,
              scrollbarAlwaysShow: true,
              dropdownMaxHeight: 200,
              decoration: InputDecoration(
                fillColor: HelperTheme.white,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.0)),
              ),
              hint: const Text(
                'Seleccionar categoria',
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
              buttonHeight: 24,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              items: List.generate(
                categoryList.length,
                (index) => DropdownMenuItem<String>(
                  value: categoryList[index].desCategoria,
                  child: Row(
                    children: [
                      Text(
                        categoryList[index].desCategoria!,
                        style: HelperTheme.bodyBlack,
                      ),
                    ],
                  ),
                ),
              ),
              value: (selectedCategory.value == "")
                  ? null
                  : selectedCategory.value,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Por favor seleccionar categoria';
                }
                return null;
              },
              onChanged: (data) {
                selectedCategory.value = data.toString();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ciudades',
              style: HelperTheme.bodyBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField2(
              scrollbarAlwaysShow: true,
              dropdownMaxHeight: 200,
              decoration: InputDecoration(
                fillColor: HelperTheme.white,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.red, width: 1.0)),
              ),
              hint: const Text(
                'Seleccionar ciudad',
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 30,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              items: List.generate(
                globalController.cityList.length,
                (index) => DropdownMenuItem<String>(
                  value: globalController.cityList[index]["value"],
                  child: Row(
                    children: [
                      Text(
                        globalController.cityList[index]["name"],
                        style: HelperTheme.bodyBlack,
                      ),
                    ],
                  ),
                ),
              ),
              value: (selectedCity.value == "") ? null : selectedCity.value,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Por favor seleccionar ciudad';
                }
                return null;
              },
              onChanged: (value) {
                selectedCity.value = value.toString();
              },
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: HelperTheme().buttonStyleMd(HelperTheme.success),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Seleccionar filtro',
                    style: HelperTheme.buttonText,
                  )
                ],
              ),
              onPressed: () async {
                Get.back();
                await getProducts();
                showBadgesProduct.value = true;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  selectedCategory.value = '';
                  selectedCity.value = '';
                  searchController.text = '';
                  showBadgesProduct.value = false;
                  Get.back();
                  await getProducts();
                },
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: HelperTheme.info,
                    fontFamily: HelperTheme.fontSource,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      barrierDismissible: true,
    );
  }

  @override
  void dispose() {
    bodyAnimationController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
