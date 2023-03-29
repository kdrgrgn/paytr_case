import 'package:flutter/material.dart';
import 'package:paytr_case/app_constant/app_colors.dart';
import 'package:paytr_case/app_constant/text_styles.dart';
import 'package:paytr_case/locator.dart';
import 'package:paytr_case/view/sign_in_view.dart';

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appKey,
      debugShowCheckedModeBanner: false,
             theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              bodyText2: blackTextStyle,
            ),

            primaryColor: appDarkColor,

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                backgroundColor: Colors.transparent,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            backgroundColor: appDarkColor,
            focusColor: appDarkColor,
            indicatorColor: appDarkColor,
          ),
      home:  SignInView(),
    );
  }
}
