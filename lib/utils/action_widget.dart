import 'package:budget_planner_project/getx/category_getx_controller.dart';
import 'package:budget_planner_project/models/actions.dart';
import 'package:budget_planner_project/models/category.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  final Operation operation;
  final void Function() onTap;

  ActionWidget(
      { required this.operation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Text(
                CategoryGetxController.to.getCategoryName(operation.categoryId)[0],
                style: TextStyle(
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
              backgroundColor: AppColors.PRIMARY_COLOR,
              radius: 20,
            ),
            SizedBox(width: SizeConfig.scaleWidth(15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CategoryGetxController.to
                      .getCategoryName(operation.categoryId),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.scaleTextFont(15),
                    color: AppColors.PRIMARY_TEXT_COLOR,
                  ),
                ),
                Text(
                  operation.notes.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: SizeConfig.scaleTextFont(15),
                    color: AppColors.GRAY_COLOR,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              operation.expense
                  ? '- \$' + operation.amount.toString()
                  : '+ \$' + operation.amount.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.scaleTextFont(15),
                color: operation.expense ? Colors.red.shade900 : Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
