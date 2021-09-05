import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class MainContainerWidget extends StatelessWidget {
  final String title;
  final String? value;
  final IconData? iconData;
  final void Function()? onTap;

  MainContainerWidget({
    required this.title,
    this.value,
    this.onTap,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {},
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: SizeConfig.scaleHeight(23)),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff181819),
                  fontSize: SizeConfig.scaleTextFont(15),
                  fontWeight: FontWeight.w600,fontFamily: 'Montserrat'),
            ),
            Spacer(),
            Text(
              value ?? '',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: SizeConfig.scaleTextFont(15),
                color: Color(0xFF7B7C98),
              ),
            ),
            iconData != null
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: SizeConfig.scaleHeight(13),
                    color: Color(0xFF7B7C98),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
