
import 'package:budget_planner_project/models/category.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;
  final void Function() onTap;

  CategoryWidget({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleWidth(20)),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.PRIMARY_COLOR,
              radius: SizeConfig.scaleHeight(20),
              child: AppText(
                text: category.name[0].toUpperCase(),
                color: Colors.white,
                fontsize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: SizeConfig.scaleWidth(20)),
            AppText(
              text: category.name,
              color: Colors.black,
              fontsize: SizeConfig.scaleTextFont(15),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
