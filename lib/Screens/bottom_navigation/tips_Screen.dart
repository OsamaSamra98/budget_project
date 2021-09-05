import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:budget_planner_project/utils/text_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class tips_Screen extends StatefulWidget {
  const tips_Screen({Key? key}) : super(key: key);

  @override
  _tips_ScreenState createState() => _tips_ScreenState();
}

class _tips_ScreenState extends State<tips_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.scaleHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    height: SizeConfig.scaleHeight(348),
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            'assets/icon/onboarding3.svg',
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(26)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: SizeConfig.scaleHeight(31.62),
                      ),
                      AppText(
                        text: 'How to save a budget 10 tips',
                        color: AppColors.PRIMARY_TEXT_COLOR,
                        fontsize: SizeConfig.scaleTextFont(20),
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: SizeConfig.scaleHeight(11),
                      ),
                      AppText(
                        text: TextTips.text_tips,
                        color: AppColors.GRAY_COLOR,
                        fontsize: SizeConfig.scaleTextFont(15),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
