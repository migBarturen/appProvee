import '../models/login_model.dart';
import '../models/user_model.dart';
import '../provider/user_provider.dart';

class UserRepository {
  final UserProvider apiUser = UserProvider();

  Future<LoginModel> login(String username, String password) async {
    return apiUser.login(username, password);
  }

  Future<int> recover(String email) async {
    return apiUser.recover(email);
  }

  Future<UserModel> getUser(LoginModel login) async {
    return apiUser.getUser(login);
  }

  Future<String> sendVerificationCode(String email) async {
    return apiUser.sendVerificationCode(email);
  }

  Future<int> validateVerificationCode(String email, int code) async {
    return apiUser.validateVerificationCode(email, code);
  }

  Future<String> create(
    String typeDocument,
    String numberDocument,
    String name,
    String lastname,
    String address,
    String phone,
    String email,
    String password,
  ) async {
    return apiUser.create(
      typeDocument,
      numberDocument,
      name,
      lastname,
      address,
      phone,
      email,
      password,
    );
  }

  Future<String> updatePassword(
      String id, String token, String numeIden, String password) async {
    return apiUser.updatePassword(id, token, numeIden, password);
  }

  Future<String> updatePerfil(
    String id,
    String token,
    String numeIden,
    String document,
    String name,
    String lastName,
    String email,
    String address,
    String nameBank,
    String numberBank,
    String cciBank,
  ) async {
    return apiUser.updatePerfil(
      id,
      token,
      numeIden,
      document,
      name,
      lastName,
      email,
      address,
      nameBank,
      numberBank,
      cciBank,
    );
  }
}
