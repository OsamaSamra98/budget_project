import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class about_Screen extends StatefulWidget {
  const about_Screen({Key? key}) : super(key: key);

  @override
  _about_ScreenState createState() => _about_ScreenState();
}

class _about_ScreenState extends State<about_Screen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Color(0XFF0D0E56),
        ),
        title: Text(
          AppLocalizations.of(context)!.about_app,
          style: TextStyle(
            color: Color(0XFF0D0E56),
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            fontSize: SizeConfig.scaleTextFont(20),
          ),
        ),
      ),
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
          SizedBox(
            height: SizeConfig.scaleHeight(15),
          ),
          Text(
            'GGateway - Flutter',
            style: TextStyle(
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.scaleTextFont(18),
                color: Color(0XFF0D0E56),
                fontFamily: 'Montserrat'),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(5),
          ),
          Text(
            'Osama Abo Samra',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: SizeConfig.scaleTextFont(15),
                color: Color(0XFF0D0E56),
                fontFamily: 'Montserrat'),
          ),
        ],
      ),
    );
  }
}
