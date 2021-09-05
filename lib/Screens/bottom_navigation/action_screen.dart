import 'package:budget_planner_project/Screens/Expense%20_Details.dart';
import 'package:budget_planner_project/getx/add_operation_getx_controller.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/action_widget.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ActionsScreen extends StatefulWidget {
  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppText(
            text: AppLocalizations.of(context)!.action,
            color: AppColors.PRIMARY_TEXT_COLOR,
            fontWeight: FontWeight.bold,
            fontsize: SizeConfig.scaleTextFont(20),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.scaleWidth(20),
              vertical: SizeConfig.scaleHeight(20)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.scaleWidth(20)),
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
                    padding: EdgeInsets.only(left: SizeConfig.scaleWidth(20),
                        right: SizeConfig.scaleWidth(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          hintStyle: TextStyle(
                              fontSize: SizeConfig.scaleTextFont(15),
                              fontFamily: 'Montserrat'),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(12),
                      vertical: SizeConfig.scaleHeight(12)),
                  margin: EdgeInsets.only(top: SizeConfig.scaleHeight(15)),
                  child: GetBuilder<ActionsGetxController>(
                      builder: (ActionsGetxController controller) {
                        return ListView.separated(
                          itemCount: controller.operations.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                index == 0
                                    ? Column(
                                  children: [
                                    AppText(
                                      text: 'Today',
                                      fontsize: 12,
                                      color: Colors.grey,
                                    ),
                                    ActionWidget(
                                      operation: controller.operations
                                          .elementAt(index),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExpenseDetails(
                                                  operation: controller
                                                      .operations
                                                      .elementAt(index),
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                                    : Column(
                                  children: [
                                    Visibility(
                                      visible: ActionsGetxController
                                          .to.operations[index].date !=
                                          ActionsGetxController
                                              .to.operations[index - 1].date,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.scaleHeight(20)),
                                        child: AppText(
                                            text: DateFormat.MMMMEEEEd('en')
                                                .format(
                                                ActionsGetxController
                                                    .to.operations[index].date),
                                            fontsize:SizeConfig.scaleTextFont(
                                                12),
                                            color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    ActionWidget(
                                      operation: controller.operations
                                          .elementAt(index),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExpenseDetails(
                                                  operation: controller
                                                      .operations
                                                      .elementAt(index),
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                                height: 0, color: Colors.grey.shade300);
                          },
                        );
                      }),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(SizeConfig.scaleHeight(25)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, SizeConfig.scaleHeight(10)),
                        color: AppColors.SHADOW_COLOR,
                        blurRadius: SizeConfig.scaleHeight(18),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
