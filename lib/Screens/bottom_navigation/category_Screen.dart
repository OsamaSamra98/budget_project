import 'package:budget_planner_project/getx/category_getx_controller.dart';
import 'package:budget_planner_project/models/category.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:budget_planner_project/utils/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Category_Screen extends StatefulWidget {
  @override
  _Category_ScreenState createState() => _Category_ScreenState();

  Category_Screen();
}

class _Category_ScreenState extends State<Category_Screen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  CategoryGetxController controller = Get.find();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: GetBuilder(
        builder: (CategoryGetxController controller) {
          List<Category> expenses =
              controller.category.where((element) => element.expense).toList();
          List<Category> income =
              controller.category.where((element) => !element.expense).toList();
          return Column(
            children: [
              SizedBox(
                height: SizeConfig.scaleHeight(108),
              ),
              Container(
                height: SizeConfig.scaleHeight(40),
                margin:
                    EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.TAB_BAR_BG,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.scaleHeight(20)),
                ),
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: AppColors.PRIMARY_COLOR,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.scaleHeight(40)),
                  ),
                  labelStyle: TextStyle(
                    fontSize: SizeConfig.scaleTextFont(13),
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: AppLocalizations.of(context)!.expenses),
                    Tab(text: AppLocalizations.of(context)!.incomes),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.scaleHeight(10)),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.scaleWidth(20),
                          vertical: SizeConfig.scaleHeight(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.scaleWidth(15)),
                      child: ListView.separated(
                        itemCount: expenses.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            category: expenses[index],
                            onTap: () {
                              popScreen(
                                  context: context, category: expenses[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              height: 0, color: AppColors.GRAY_COLOR);
                        },
                      ),
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.scaleWidth(20),
                          vertical: SizeConfig.scaleHeight(20)),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.scaleWidth(15)),
                      child: ListView.separated(
                        itemCount: income.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                              category: income[index],
                              onTap: () {
                                popScreen(
                                    context: context, category: income[index]);
                              });
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              height: 0, color: AppColors.GRAY_COLOR);
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          SizeConfig.scaleHeight(SizeConfig.scaleHeight(25)),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(
                                0,
                                SizeConfig.scaleHeight(
                                    SizeConfig.scaleHeight(10))),
                            color: AppColors.SHADOW_COLOR,
                            blurRadius: SizeConfig.scaleHeight(
                                SizeConfig.scaleHeight(18)),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  popScreen({required Category category, required BuildContext context}) {
    Navigator.pop(context, category);
  }
}
