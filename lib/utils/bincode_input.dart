import 'package:flutter/material.dart';

class BinCodeInputWidget extends StatelessWidget {
  late final String number;
  late final bool isFilled;

  BinCodeInputWidget({
    required this.number,
    required this.isFilled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'montserrat',
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
            color: isFilled ? Color(0XFF472FC8) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: 0,
                  blurRadius: 18)
            ]),
      ),
    );
  }
}
