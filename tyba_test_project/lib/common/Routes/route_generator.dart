import 'package:flutter/material.dart';
import 'package:tyba_test_project/common/Routes/routes.dart';
import 'package:tyba_test_project/screens/home_page.dart';
import 'package:tyba_test_project/screens/initial_page.dart';
import 'package:tyba_test_project/screens/sign_in_page.dart';
import 'package:tyba_test_project/screens/sign_up_page.dart';

class RouteGenerator {
  static Widget currentRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    bool fullscreenDialog = false;
    debugPrint("${settings.name}");
    switch (settings.name) {
      case Routes.root:
        currentRoute = InitialPage();
        break;
      case Routes.home:
        currentRoute = HomePage();
        fullscreenDialog = true;
        break;
      case Routes.signUp:
        currentRoute = SignUpPage();
        break;
      case Routes.signIn:
        currentRoute = SignInPage();
        break;
      default:
        currentRoute = null;
        return _errorRoute();
    }
    return _buildRoute(currentRoute, fullscreenDialog: fullscreenDialog);
  }

  static Route<dynamic> _buildRoute(Widget screen,
          {bool fullscreenDialog = false}) =>
      MaterialPageRoute(
          builder: (_) => screen, fullscreenDialog: fullscreenDialog);

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text(
              'Route is invalid, please check if route exists in Routes constants.'),
        ),
      ),
    );
  }
}
