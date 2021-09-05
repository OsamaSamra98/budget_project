
import 'package:budget_planner_project/getx/currency_getx_controller.dart';
import 'package:budget_planner_project/models/currency.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/currency_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'currency',
          style: TextStyle(
            color: Color(0xFF0D0E56),
            fontWeight: FontWeight.bold,
            fontSize: SizeConfig.scaleHeight(20),
          ),
        ),
      ),
      body: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(
          top: SizeConfig.scaleHeight(100),
          start: SizeConfig.scaleWidth(20),
          end: SizeConfig.scaleWidth(20),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.scaleWidth(15),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, SizeConfig.scaleHeight(10)),
              color: Color(0xFFE9E7F1),
              blurRadius: SizeConfig.scaleHeight(18),
              spreadRadius: 0,
            ),
          ],
        ),
        child: GetBuilder<CurrencyGetxController>(
          builder: (CurrencyGetxController controller) {
            return ListView.separated(
              itemCount: controller.currencies.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CurrencyWidget(
                  currency: controller.currencies[index],
                  onTap: () {
                    popScreen(controller.currencies[index], context);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 0, color: Color(0xFF7B7C98));
              },
            );
          },
        ),
      ),
    );
  }

  popScreen(Currency currency, BuildContext context) {
    Navigator.pop(context, currency);
  }
}
