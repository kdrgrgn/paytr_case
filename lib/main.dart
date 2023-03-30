import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:paytr_case/app_constant/app_colors.dart';
import 'package:paytr_case/app_constant/text_styles.dart';
import 'package:paytr_case/app_constant/app_env_keys.dart';
import 'package:paytr_case/landing_page.dart';
import 'package:paytr_case/locator.dart';
import 'package:paytr_case/service/hive_manager.dart';

final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      color: Colors.red,
      location: BannerLocation.topEnd,
      child: MaterialApp(
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
        home: LandingPage(),
      ),
    );
  }
}

init({String flavorName = 'production'}) async {
  await WidgetsFlutterBinding.ensureInitialized();
  await HiveManager.init();
  setupLocator();
  await dotenv.load(fileName: 'env/.env.$flavorName');

  if (EnvKeys.env_hint != "p")
    FlavorConfig(
      name: EnvKeys.app_flavor,
      color: Colors.red,
      location: BannerLocation.topEnd,
    );
  return;
}
