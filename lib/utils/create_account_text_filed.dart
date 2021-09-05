
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAccountTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String? errorMsg;
  final IconData? suffix;
  final String? prefix;
  final TextInputType inputType;

  CreateAccountTextField(
      {required this.hint,
      required this.controller,
      this.errorMsg,
      this.suffix,
      this.prefix,
      this.inputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(10)),
      child: Row(
        children: [
          AppText(
            text: prefix ?? '',
            color: Color(0xff181819),
            fontsize: SizeConfig.scaleTextFont(15),
            fontWeight: FontWeight.w600,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: inputType,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                // hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(
                  color: AppColors.GRAY_COLOR,
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontFamily: 'montserrat',
                ),
              ),
              style: TextStyle(
                color: AppColors.PRIMARY_TEXT_COLOR,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
                fontFamily: 'montserrat',
              ),

            ),
          ),
        ],
      ),
    );
  }
}
