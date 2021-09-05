
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final FontWeight fontWeight;
  final double fontSize;
  final String fontFamily;
  final TextAlign textAlign;
  final void Function() onPressed;

  AppElevatedButton(
      {required this.text,
      this.textColor = Colors.white,
      this.fontFamily = 'montserrat',
      this.fontWeight = FontWeight.normal,
      this.fontSize = 15,
      this.textAlign = TextAlign.start,
      this.buttonColor = AppColors.PRIMARY_COLOR,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,
          style: TextStyle(
            fontFamily: fontFamily,
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          )),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, SizeConfig.scaleHeight(60)),
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizeConfig.scaleHeight(30),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
