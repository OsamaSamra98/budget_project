import 'package:budget_planner_project/getx/category_getx_controller.dart';
import 'package:budget_planner_project/getx/currency_getx_controller.dart';
import 'package:budget_planner_project/models/actions.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:budget_planner_project/utils/category_type_widget.dart';
import 'package:budget_planner_project/utils/general_text_field.dart';
import 'package:budget_planner_project/utils/header_widget.dart';
import 'package:budget_planner_project/utils/main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ExpenseDetails extends StatelessWidget {
  final Operation operation;

  ExpenseDetails({required this.operation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: 'Expense Details',
          color: AppColors.PRIMARY_TEXT_COLOR,
          fontWeight:FontWeight.bold,
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: SizeConfig.scaleWidth(20),
            left: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(80),
          ),
          child: Column(
            children: [
              HeaderWidget(
                  CategoryGetxController.to
                      .getCategoryName(operation.categoryId),
                  'wallet'),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              GeneralTextField(
                controller: null,
                hint: operation.amount.toString(),
                enable: false,
                hintColor: AppColors.PRIMARY_TEXT_COLOR,
                hintSize: SizeConfig.scaleTextFont(30),
                height: SizeConfig.scaleHeight(67),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    index: operation.expense ? 1 : 0,
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                      title: AppLocalizations.of(context)!.incomes,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green.shade900,
                      ),
                      index: !operation.expense ? 2 : 0),
                ],
              ),
              SizedBox(height: SizeConfig.scaleHeight(20)),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(10)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(SizeConfig.scaleHeight(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        color: AppColors.SHADOW_COLOR,
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0),
                  ],
                ),
                child: Column(
                  children: [
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.categories,
                      value: CategoryGetxController.to
                          .getCategoryName(operation.categoryId),
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.date,
                      value: DateFormat.yMd('en').format(operation.date) ,
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.currency,
                      value: CurrencyGetxController.to
                          .getCurrencyName(operation.currencyId),
                      iconData: Icons.arrow_forward_ios,
                    ),
                  ],
                ),
              ),
              GeneralTextField(
                enable: false,
                height: SizeConfig.scaleHeight(112),
                hintColor: Colors.grey,
                hint: operation.notes,
                controller: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
