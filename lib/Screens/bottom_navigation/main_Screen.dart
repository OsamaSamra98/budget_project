import 'package:budget_planner_project/Screens/bottom_navigation/AddNewCategory_Screen.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/add_opatation.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/category_Screen.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/home_Screen.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/profile_Screen.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/tips_Screen.dart';
import 'package:budget_planner_project/getx/add_operation_getx_controller.dart';
import 'package:budget_planner_project/getx/category_getx_controller.dart';
import 'package:budget_planner_project/models/bn_screen.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class main_Screen extends StatefulWidget {

  @override
  _main_ScreenState createState() => _main_ScreenState();
}

class _main_ScreenState extends State<main_Screen> {
  int _selectedItemIndex = 0;
  String _title = 'Home';
  CategoryGetxController categoryGetxController = Get.put(CategoryGetxController());
  ActionsGetxController actionGetxController = Get.put(ActionsGetxController());


  List<BottomNavigationScreen> _screens = <BottomNavigationScreen>[
     BottomNavigationScreen(title: ('Home'), widget: home_Screen()),
     BottomNavigationScreen(title: ('category'), widget: Category_Screen()),
     BottomNavigationScreen(title: (''), widget: AddOperation()),
     BottomNavigationScreen(title: ('profile'), widget: ProfileScreen()),
     BottomNavigationScreen(title: ('Tips'), widget: tips_Screen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        title: Text(
          _screens.elementAt(_selectedItemIndex).title,
          style: TextStyle(
            color: Color(0XFF0D0E56),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: SizeConfig.scaleTextFont(20),
          ),
        ),
        actions: [
          Visibility(
              visible:  _selectedItemIndex == 1  ,
              replacement: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      right: SizeConfig.scaleWidth(20)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/setting_Screen');
                    },
                    icon: Icon(Icons.settings),
                    color: Color(0XFF0D0E56),
                  )),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeConfig.scaleWidth(20),
                      right: SizeConfig.scaleWidth(20)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/AddNewCategory_Screen');
                    },
                    icon: Icon(Icons.add_circle_sharp),
                    color: Color(0XFF0D0E56),
                  )),)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        onTap: (int selectedItemIndex) {
          setState(() {
            _selectedItemIndex = selectedItemIndex;
          });
        },
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: AppLocalizations.of(context)!.categories,
          ),
          BottomNavigationBarItem(
            icon: FloatingActionButton(
              onPressed: () {Navigator.pushNamed(context, '/AddOperation');},
              child: Icon(Icons.add),
              backgroundColor: Color(0XFF0D0E56),
              elevation: 8,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline_rounded),
            label: AppLocalizations.of(context)!.tips,
          ),
        ],
      ),
      body: _screens.elementAt(_selectedItemIndex).widget ,
    );
  }
}
