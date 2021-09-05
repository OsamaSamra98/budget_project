import 'package:budget_planner_project/Screens/login_Screen.dart';
import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class successcreate_Screen extends StatefulWidget {
  const successcreate_Screen({Key? key}) : super(key: key);

  @override
  _successcreate_ScreenState createState() => _successcreate_ScreenState();
}

class _successcreate_ScreenState extends State<successcreate_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => login_Screen(),
          ),
              (route) => false);
      ;
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
            height: SizeConfig.scaleHeight(115),
            width: SizeConfig.scaleWidth(120),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
              child: SvgPicture.asset('assets/icon/ic_like.svg'),
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(30),
          ),
          Text(
            'Congratulations! ',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: SizeConfig.scaleTextFont(24),
                color: Color(0XFF0D0E56),
                fontFamily: 'Montserrat'),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(15),
          ),
          Text(
            'You have registered',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.scaleTextFont(18),
                color: Color(0XFF0D0E56),
                fontFamily: 'Montserrat'),
          ),
        ],
      ),
    );
  }
}
