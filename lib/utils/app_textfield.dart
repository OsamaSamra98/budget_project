import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class app_textfield extends StatelessWidget {
  final String title;
  final bool secure;
  final TextEditingController? controller;
  final double horizontalpadding ;


  app_textfield({
    required this.title,
    this.secure = false,
    this.horizontalpadding = 20,
    this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(horizontalpadding)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0XFF979797),
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: SizeConfig.scaleWidth(20),right: SizeConfig.scaleWidth(20)),
          child: TextField(
            controller:controller ,
            obscureText: secure,
            decoration: InputDecoration(
                hintText: title,
                hintStyle: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(15),
                    fontFamily: 'Montserrat'),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
