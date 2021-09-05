import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_textfield.dart';
import 'package:budget_planner_project/utils/indicator_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class add_newcategory_Screen extends StatefulWidget {
  const add_newcategory_Screen({Key? key}) : super(key: key);

  @override
  _add_newcategory_ScreenState createState() => _add_newcategory_ScreenState();
}

class _add_newcategory_ScreenState extends State<add_newcategory_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.scaleWidth(20),
                  right: SizeConfig.scaleWidth(20)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.cancel),
                color: Color(0XFF0D0E56),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.scaleHeight(25),
            ),
            Center(
              child: Container(
                height: SizeConfig.scaleHeight(115),
                width: SizeConfig.scaleWidth(120),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(42),
                      vertical: SizeConfig.scaleHeight(24)),
                  child: SvgPicture.asset('assets/icon/wallet.svg'),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(13),
            ),
            Text(
              'Add Category ',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.scaleTextFont(20),
                  color: Color(0XFF0D0E56)),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(50),
            ),
            Row(
              children: [
                indicator_card(title: 'Expenses',icon: Icons.arrow_upward,color: Colors.red,),
                SizedBox(
                  width: SizeConfig.scaleWidth(10),
                ),
                indicator_card(title: 'Income',icon: Icons.arrow_downward ,color: Colors.green,),
              ],
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(11),
            ),
            Container(
              height: SizeConfig.scaleHeight(67),
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
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(14),vertical: SizeConfig.scaleHeight(20)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter category name',
                      hintStyle: TextStyle(
                          fontSize: SizeConfig.scaleTextFont(15),
                          fontFamily: 'Montserrat'),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            ElevatedButton(
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF472FC8),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))), onPressed: () { Navigator.pushNamed(context, '/successcreate_Screen'); },
            ),





          ],
        ),
      ),
    );
  }
}
