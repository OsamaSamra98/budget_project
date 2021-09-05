
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class CategoryTypeWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final int index;
  final void Function()? onPressed;

  CategoryTypeWidget(
      {required this.title,
      required this.icon,
      this.index = 0,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(22)),

          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                SizedBox(
                  height: SizeConfig.scaleHeight(8),
                ),
                AppText(
                  text:title,
                  fontWeight: FontWeight.w500,
                  fontsize: SizeConfig.scaleTextFont(15),
                  color: AppColors.BLOCK_COLOR,
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
            border: Border.all(
                width: 2,
                color: index == 0
                    ? Colors.white
                    : index == 1
                        ? Colors.red
                        : Colors.green),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, SizeConfig.scaleHeight(3)),
                  color: AppColors.SHADOW_COLOR,
                  blurRadius: SizeConfig.scaleHeight(6),
                  spreadRadius: 0),
            ],
          ),
        ),
      ),
    );
  }
}
