
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String label;
  final Icon leading;
  final IconData? trailingIcon;
  final Color fillColor;
  final Color labelColor;
  final Color? boarderColor;
  final void Function()? onTap;

  SettingsCard({
    required this.label,
    required this.leading,
    this.trailingIcon,
    this.fillColor = Colors.white,
    this.boarderColor,
    this.onTap,
    this.labelColor = AppColors.PRIMARY_TEXT_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.scaleHeight(23),
            horizontal: SizeConfig.scaleWidth(20)),
        margin: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(8)),
        child: Row(
          children: [
            leading,
            SizedBox(
              width: SizeConfig.scaleWidth(15),
            ),
            AppText(
              text: label,
              color: labelColor,
              fontWeight: FontWeight.w500,
              fontsize: SizeConfig.scaleTextFont(15),
            ),
            Spacer(),
            trailingIcon != null
                ? Icon(
              trailingIcon,
              size: SizeConfig.scaleHeight(13),
              color: AppColors.GRAY_COLOR,
            )
                : Container(),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(10)),
          color: fillColor,
          border: boarderColor != null
              ? Border.all(color: boarderColor!)
              : Border.all(color: Colors.white),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.SHADOW_COLOR,
                offset: Offset(0, SizeConfig.scaleHeight(3)),
                blurRadius: SizeConfig.scaleHeight(7),
                spreadRadius: 0)
          ],
        ),
      ),
    );
  }
}
