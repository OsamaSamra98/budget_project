
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';


class LimitWidget extends StatelessWidget {

  final String message;
  final void Function()? onTap;

  LimitWidget({ required this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SizeConfig.scaleHeight(5)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, SizeConfig.scaleHeight(10)),
            color: AppColors.SHADOW_COLOR,
            blurRadius: SizeConfig.scaleHeight(18),
            spreadRadius: 0,
          ),
        ],
      ),
        child: Row(
          children: [
            SizedBox(width: SizeConfig.scaleWidth(20)),
            Icon(Icons.notifications_active,color: Colors.red.shade900,),
            SizedBox(width: SizeConfig.scaleWidth(14)),
            AppText(
              text:message,
              color: Colors.black,
              fontsize: SizeConfig.scaleTextFont(15),
              fontWeight: FontWeight.w500,
            ),
            Spacer(),
            IconButton(icon: Icon(Icons.cancel_rounded), onPressed: onTap??(){})
          ],
        ),
    );
  }
}
