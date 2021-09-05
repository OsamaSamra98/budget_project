import 'package:budget_planner_project/getx/currency_getx_controller.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class launch_Screen extends StatefulWidget {

  @override
  _launch_ScreenState createState() => _launch_ScreenState();
}

class _launch_ScreenState extends State<launch_Screen> {
  CurrencyGetxController currencyGetxController = Get.put(CurrencyGetxController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {String route = SharedPrefController().isLoggedIn
        ? '/main_Screen'
        : '/onboarding_Screen';
    Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.transparent,
          ),
          Container(
            height: SizeConfig.scaleHeight(167),
            width: SizeConfig.scaleWidth(160),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(42),
                  vertical: SizeConfig.scaleHeight(24)),
              child: SvgPicture.asset(iconlaunch),
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(30),
          ),
          Text(
            'Budget Planner',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.scaleTextFont(24),
                color: Color(0XFF0D0E56),
                fontFamily: 'Montserrat'),
          ),
        ],
      ),
    );
  }
}
