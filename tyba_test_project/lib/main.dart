import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tyba_test_project/providers/user_state_provider.dart';

import 'common/Routes/route_generator.dart';
import 'common/color_palette.dart';

void main() {
  runApp(TybaTestApp());
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = ColorPalette.Third
    ..indicatorColor = ColorPalette.Fourth
    ..progressColor = ColorPalette.Primary
    ..backgroundColor = Colors.white
    ..maskType = EasyLoadingMaskType.black
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..userInteractions = false;
}

class TybaTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStateProvider>(create: (_) => UserStateProvider()),
      ],
      child: MaterialApp(
        builder: (BuildContext context, Widget child) {
          return Material(
            type: MaterialType.transparency,
            child: FlutterEasyLoading(
              child: child,
            ),
          );
        },
        theme: ThemeData(primaryColor: ColorPalette.Primary),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
