import 'package:get/get.dart';
import '../middlewares/auth_guard_middleware.dart';
import '../ui/pages/change_password/change_password_page.dart';
import '../ui/pages/founding_request/founding_request_page.dart';
import '../ui/pages/login/login_page.dart';
import '../ui/pages/main/main_page.dart';
import '../ui/pages/order/order_page.dart';
import '../ui/pages/perfil/perfil_page.dart';
import '../ui/pages/publication/publication_page.dart';
import '../ui/pages/recover_password/recover_password_page.dart';
import '../ui/pages/register_user/register_user_page_personal.dart';
import '../ui/pages/splash/splash_page.dart';
import '../ui/pages/wallet/wallet_page.dart';
import '../ui/pages/weekly_draw/weekly_draw_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.CHANGE_PASSWORD,
      page: () => const ChangePasswordPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.FOUNDING_REQUEST,
      page: () => const FoundingRequestPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => const MainPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.PERFIL,
      page: () => const PerfilPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.RECOVER_PASSWORD,
      page: () => const RecoverPasswordPage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.REGISTER_USER,
      page: () => const RegisterUserPagePersonal(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ORDER,
      page: () => const OrderPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.PUBLICATION,
      page: () => const PublicationPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.WALLET,
      page: () => const WalletPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
    GetPage(
      name: Routes.WEEKLY_DRAW,
      page: () => const WeeklyDrawPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      middlewares: [AuthGuardMiddleware()],
    ),
  ];
}
