import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'AppColors.dart';
import 'SizeConfig.dart';
import 'app_text.dart';

class ListTileAction extends StatelessWidget {
 final String image;
 final String text1;
 final String text2;
 final String text3;
 final Color color;
 final double Width;
 ListTileAction({required this.image, required this.text1, this.text2='', this.text3='', this.color=Colors.red, this.Width=13});

  @override
  Widget build(BuildContext context) {
     return Row(
       children: [
        Image.asset(image),
        SizedBox(width: SizeConfig.scaleWidth(Width),),
        Column(
         crossAxisAlignment: CrossAxisAlignment.start,

         children: [
        AppText(text: text1, color: AppColors.PRIMARY_COLOR, fontsize: SizeConfig.scaleTextFont(15),fontWeight: FontWeight.w600,),
       AppText(text: text2, color: AppColors.PRIMARY_TEXT_COLOR, fontsize: SizeConfig.scaleTextFont(15),),
         ],
        ),
        Spacer(),
        AppText(text: text3, color: color, fontsize: SizeConfig.scaleTextFont(15),fontWeight: FontWeight.w600,),
       ],

    );
  }
}

