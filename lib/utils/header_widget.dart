
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class HeaderWidget extends StatelessWidget {

  String label;
  String svgIcon;

  HeaderWidget(this.label, this.svgIcon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: SizeConfig.scaleHeight(120),
          width: SizeConfig.scaleHeight(120),
          padding: EdgeInsets.all(SizeConfig.scaleHeight(30)),
          child: SvgPicture.asset('assets/icon/$svgIcon.svg'),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(0, SizeConfig.scaleHeight(10)),
                color:  Color(0xFFE9E7F1),
                blurRadius: SizeConfig.scaleHeight(18),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        SizedBox(height: SizeConfig.scaleHeight(13)),
        AppText(
          text: label,
          color: Color(0xFF0D0E56),
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontsize: SizeConfig.scaleTextFont(20),
        ),
      ],
    );
  }
}
