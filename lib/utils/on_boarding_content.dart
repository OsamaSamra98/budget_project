import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';

class onboardingcontent extends StatelessWidget {
  final String text;
  final String subtext;
  final String image;
  final String buttontext;

  onboardingcontent({
    required this.text,
    required this.subtext,
    required this.image,
    this.buttontext = 'Next',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 117,),
        Text(text,
            style: TextStyle(
                color: Color(0XFF0D0E56),
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.scaleTextFont(20),fontFamily: 'Montserrat')),
        SizedBox(
          height: SizeConfig.scaleHeight(11),
        ),
        Text(subtext,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0XFF7B7C98),
                fontWeight: FontWeight.w400,
                fontSize: SizeConfig.scaleTextFont(15),fontFamily: 'Montserrat')),
        Spacer(),
        SvgPicture.asset(
          'assets/icon/${image}.svg',
        ),
        Spacer(),
      ],
    );
  }
}
