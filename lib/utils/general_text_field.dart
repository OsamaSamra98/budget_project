
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class GeneralTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Icon? prefix;
  final double height;
  TextAlign textAlign;
  final bool enable;
  final Color hintColor;
  final double hintSize;
  final double textSize;

  GeneralTextField({
    required this.controller,
    required this.hint,
    this.prefix,
    this.textAlign = TextAlign.start,
    required this.height,
    this.enable = true,
    this.hintColor = AppColors.SHADOW_COLOR,
    this.hintSize = 15,
    this.textSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              offset: Offset(0, 0),
              color: AppColors.SHADOW_COLOR,
              blurRadius: SizeConfig.scaleHeight(6),
              spreadRadius: 0),
        ],
      ),
      child: TextField(
        minLines: null,
        maxLines: null,
        expands: true,
        enabled: enable,
        controller: controller,
        textAlign: textAlign,
        style: TextStyle(
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
            color: AppColors.PRIMARY_TEXT_COLOR,
            fontSize: SizeConfig.scaleTextFont(textSize)),
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
                color: hintColor,
                fontFamily: 'montserrat',
                fontSize: SizeConfig.scaleTextFont(hintSize),
                fontWeight: FontWeight.normal),
            contentPadding: EdgeInsetsDirectional.only(
                start: SizeConfig.scaleWidth(14),
                top: SizeConfig.scaleHeight(20))),
      ),
    );
  }
}
