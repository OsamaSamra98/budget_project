
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class PriceTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon? prefix;
  final double height;
  TextAlign textAlign;

  PriceTextField({
    required this.controller,
    required this.hint,
    this.prefix,
    this.textAlign = TextAlign.start,
     this.height = 23,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(0)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0, 4),
              color: AppColors.SHADOW_COLOR,
              blurRadius: SizeConfig.scaleHeight(4),
              spreadRadius: 0),
        ],
      ),
      child: TextField(
        maxLines: 1,
        controller: controller,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
            color: AppColors.PRIMARY_TEXT_COLOR,
            fontSize: SizeConfig.scaleTextFont(20)),
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix,
            errorStyle: TextStyle(
                color: Colors.red.shade900,
                fontFamily: 'montserrat',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.normal),
            hintStyle: TextStyle(
                color: AppColors.GRAY_COLOR,
                fontFamily: 'montserrat',
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(14),
                top: SizeConfig.scaleHeight(20))),
      ),
    );
  }
}
