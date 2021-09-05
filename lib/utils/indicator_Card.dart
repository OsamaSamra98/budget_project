import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

class indicator_card extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Color bordercolor;


  indicator_card({
    required this.title,
    required this.color,
    required this.icon,
    this.bordercolor = Colors.white,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: SizeConfig.scaleWidth(182),
        height: SizeConfig.scaleHeight(92),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border:Border.all(color: bordercolor,width: 1),
          boxShadow: [

            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ,
              color: color,
              size: SizeConfig.scaleHeight(30),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(8),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: SizeConfig.scaleTextFont(15),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Color(0XFF181819),
              ),
            )
          ],
        ),
      ),
    );
  }
}
