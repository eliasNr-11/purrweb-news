import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:purrweb_news/presentation/constants/constants.dart';
import 'package:purrweb_news/presentation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            themeMode: ThemeMode.dark,
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: const ColorScheme.dark()
                  .copyWith(primary: Constants.kcPrimary),
              scaffoldBackgroundColor: Constants.kcBkg,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: Constants.kcTextOne,
                    displayColor: Constants.kcTextOne,
                    // fontFamily: 'Poppins',
                  ),
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(color: Constants.kcTextOne),
                iconTheme: IconThemeData(color: Constants.kcTextOne),
                systemOverlayStyle:
                    SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
              ),
              iconTheme: const IconThemeData(color: Constants.kcTextOne),
              dialogBackgroundColor: Constants.kcSecondary,
              // fontFamily: 'Poppins',
              brightness: Brightness.dark,
            ),
            routerConfig: routes(),
          );
        });
  }
}
