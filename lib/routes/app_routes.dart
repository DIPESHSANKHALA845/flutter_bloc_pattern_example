import 'package:bloc_pattern/ui/list/list_view.dart';
import 'package:bloc_pattern/ui/login/login_view.dart';
import 'package:bloc_pattern/ui/splash/splash_view.dart';
import '../ui/no_internet/no_internet_view.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const noInternet = '/NoInternetView';
  static const postList = '/postList';

  static final routes = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    noInternet: (context) => const NoInternetView(),
    postList: (context) => const ListPage(),
  };
}
