
import 'package:budget_planner_project/Screens/bottom_navigation/category_Screen.dart';
import 'package:budget_planner_project/Screens/bottom_navigation/create_operation_success.dart';
import 'package:budget_planner_project/getx/add_operation_getx_controller.dart';
import 'package:budget_planner_project/models/actions.dart';
import 'package:budget_planner_project/models/category.dart';
import 'package:budget_planner_project/models/currency.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_elevated_button.dart';
import 'package:budget_planner_project/utils/category_type_widget.dart';
import 'package:budget_planner_project/utils/general_text_field.dart';
import 'package:budget_planner_project/utils/header_widget.dart';
import 'package:budget_planner_project/utils/helpers.dart';
import 'package:budget_planner_project/utils/main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../currency_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddOperation extends StatefulWidget {
  @override
  _AddOperationState createState() => _AddOperationState();
}

class _AddOperationState extends State<AddOperation> with Helpers {
  Currency? currency;
  Category? category;
  DateTime? _pickedDateValue;
  String? _pickedDate;

  late TextEditingController noteController;
  late TextEditingController amountController;

  @override
  void initState() {
    noteController = TextEditingController();
    amountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    noteController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  AppLocalizations.of(context)!.add_operation, 'wallet'),
              SizedBox(
                height: SizeConfig.scaleHeight(20),
              ),
              GeneralTextField(
                controller: amountController,
                hint: '000.0 \$',
                height: SizeConfig.scaleHeight(67),
                textAlign: TextAlign.center,
                hintColor: Colors.grey,
                hintSize: SizeConfig.scaleTextFont(25),
                textSize: SizeConfig.scaleTextFont(25),
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
                    index: category != null
                        ? category!.expense
                        ? 1
                        : 0
                        : 0,
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
                    index: category != null
                        ? !category!.expense
                        ? 2
                        : 0
                        : 0,
                  ),
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
                      value: category != null ? category!.name : '',
                      onTap: () async {
                        Category selectedCategory = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Category_Screen(),
                          ),
                        );
                        setState(() {
                          category = selectedCategory;
                        });
                      },
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.date,
                      value: _pickedDate ?? 'D/M/Y ',
                      onTap: () async {
                        await pickDate();
                        setState(() {});
                      },
                      iconData: Icons.arrow_forward_ios,
                    ),
                    Divider(height: 0, color: AppColors.GRAY_COLOR),
                    MainContainerWidget(
                      title: AppLocalizations.of(context)!.currency,
                      value: currency != null ? currency!.nameEn : '',
                      iconData: Icons.arrow_forward_ios,
                      onTap: () async {
                        Currency selectedCurrency = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrencyScreen(),
                          ),
                        );
                        setState(() {
                          currency = selectedCurrency;
                        });
                      },
                    ),
                  ],
                ),
              ),
              GeneralTextField(
                height: SizeConfig.scaleHeight(112),
                hint: AppLocalizations.of(context)!.note,
                controller: noteController,
                hintColor: Colors.grey,
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(30),
              ),
              AppElevatedButton(
                text: AppLocalizations.of(context)!.add,
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

  Future pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (dateTime != null) {
      _pickedDateValue = dateTime;
      var format = DateFormat.yMd('en');
      _pickedDate = format.format(dateTime);
      print('Date: ${_pickedDate}');
    }
  }

  Future performSave() async {
    if (checkData()) {
      await save();
    }
  }

  bool checkData() {
    if (_pickedDateValue != null &&
        amountController.text.isNotEmpty &&
        currency != null &&
        category != null) {
      return true;
    }
    showSnackBar(context,
        message: AppLocalizations.of(context)!.empty_field_error, error: true);
    return false;
  }

  Future save() async {
    bool created = await ActionsGetxController.to.createOperation(operation);
    if (created) {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.success_add_operation);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => CreateOperationSuccess()));
    } else {
      showSnackBar(context,
          message: AppLocalizations.of(context)!.failed_add_operation,
          error: true);
    }
  }

  Operation get operation {
    Operation operation = Operation();
    operation.amount = int.parse(amountController.text);
    operation.categoryId = category!.id;
    operation.currencyId = currency!.id;
    operation.expense = category!.expense;
    operation.notes = noteController.text;
    operation.date = _pickedDateValue!;
    operation.userId = SharedPrefController().id;
    return operation;
  }
}
