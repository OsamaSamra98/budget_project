import 'package:budget_planner_project/Database/db_provider.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/add_opatation.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/category_Screen.dart';
import 'package:budget_planner_project/Screens/launch_Screen.dart';
import 'package:budget_planner_project/Screens/onboarding.dart';
import 'package:budget_planner_project/Screens/Expense _Details.dart';
import 'package:budget_planner_project/getx/language_getx_controller.dart';
import 'package:budget_planner_project/storge/app_pref_controller.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Screens/Bincode_Screen.dart';
import 'Screens/about_Screen.dart';
import 'Screens/bottom_navigation/AddNewCategory_Screen.dart';
import 'Screens/bottom_navigation/home_Screen.dart';
import 'Screens/bottom_navigation/main_Screen.dart';
import 'Screens/bottom_navigation/tips_Screen.dart';
import 'Screens/currency_Screen.dart';
import 'Screens/login_Screen.dart';
import 'Screens/setting_Screen.dart';
import 'Screens/signup_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Screens/successcreate.dart';
import 'getx/language_getx_controller.dart';
import 'package:get/get.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBProvider().initDatabase();
  await SharedPrefController().initSharePre();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LanguageGetxController languageGetxController =
      Get.put(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar'),
          const Locale('en'),
        ],
        locale: Locale(languageGetxController.languageCode.value),

        theme: ThemeData(
            appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          brightness: Brightness.dark,iconTheme: IconThemeData(color: AppColors.PRIMARY_COLOR)
        )),
        initialRoute: '/launch_Screen',
        routes: {
          '/launch_Screen': (context) => launch_Screen(),
          '/onboarding_Screen': (context) => onboarding_Screen(),
          '/login_Screen': (context) => login_Screen(),
          '/setting_Screen': (context) => setting_Screen(),
          '/about_Screen': (context) => about_Screen(),
          '/CreateAccountScreen': (context) => CreateAccountScreen(),
          '/successcreate_Screen': (context) => successcreate_Screen(),
          '/main_Screen': (context) => main_Screen(),
          '/home_Screen': (context) => home_Screen(),
          '/BinCodeScreen': (context) => BinCodeScreen(),
          '/AddNewCategory_Screen': (context) => AddNewCategory_Screen(),
          '/AddOperation': (context) => AddOperation(),
          '/tips_Screen': (context) => tips_Screen(),
        },
      );
    });
  }



}
