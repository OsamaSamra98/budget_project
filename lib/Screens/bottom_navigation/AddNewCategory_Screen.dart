import 'package:budget_planner_project/getx/category_getx_controller.dart';
import 'package:budget_planner_project/models/category.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_elevated_button.dart';
import 'package:budget_planner_project/utils/app_textfield.dart';
import 'package:budget_planner_project/utils/category_type_widget.dart';
import 'package:budget_planner_project/utils/header_widget.dart';
import 'package:budget_planner_project/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewCategory_Screen extends StatefulWidget {
  @override
  _AddNewCategory_ScreenState createState() => _AddNewCategory_ScreenState();
}

class _AddNewCategory_ScreenState extends State<AddNewCategory_Screen>
    with Helpers {
  int expensesSelected = 0;
  int incomeSelected = 0;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.scaleWidth(20),
            end: SizeConfig.scaleWidth(20),
            top: SizeConfig.scaleHeight(80),
          ),
          child: Column(
            children: [
              HeaderWidget(
                  AppLocalizations.of(context)!.add_category, 'wallet'),
              SizedBox(height: SizeConfig.scaleHeight(50)),
              Row(
                children: [
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.expenses,
                    index: expensesSelected,
                    icon: Icon(
                      Icons.arrow_upward_sharp,
                      color: Colors.red.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        expensesSelected = 1;
                        incomeSelected = 0;
                      });
                    },
                  ),
                  SizedBox(
                    width: SizeConfig.scaleWidth(10),
                  ),
                  CategoryTypeWidget(
                    title: AppLocalizations.of(context)!.incomes,
                    index: incomeSelected,
                    icon: Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.green.shade900,
                    ),
                    onPressed: () {
                      setState(() {
                        incomeSelected = 2;
                        expensesSelected = 0;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(15),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(67),
                child: app_textfield(
                  controller: textEditingController,
                  title: AppLocalizations.of(context)!.enter_category_name,
                  horizontalpadding: 0,
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(10),
              ),
              AppElevatedButton(
                text: AppLocalizations.of(context)!.add,
                fontSize: SizeConfig.scaleTextFont(15),
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                onPressed: () async {
                  await performSave();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future performSave() async {
    if (checkData()) {
      await save();
      Navigator.pop(context);
    }
  }

  bool checkData() {
    if (textEditingController.text.isNotEmpty && categorySelect()) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool created = await CategoryGetxController.to.createCategory(category);
    String message = created
        ? AppLocalizations.of(context)!.category_created_successfully
        : AppLocalizations.of(context)!.category_created_field;
    showSnackBar(context, message: message, error: !created);
  }

  Category get category {
    Category category = Category();
    category.name = textEditingController.text;
    category.expense = expensesSelected == 1;
    return category;
  }

  bool categorySelect() {
    if (incomeSelected == 0) {
      if (expensesSelected == 0) {
        return false;
      }
    }
    return true;
  }
}
