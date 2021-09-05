import 'package:budget_planner_project/Screens/bottom_navigation/action_screen.dart';
import 'package:budget_planner_project/getx/add_operation_getx_controller.dart';
import 'package:budget_planner_project/models/actions.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/action_widget.dart';
import 'package:budget_planner_project/utils/app_elevated_button.dart';
import 'package:budget_planner_project/utils/app_text.dart';
import 'package:budget_planner_project/utils/limit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class home_Screen extends StatefulWidget {
  @override
  _home_ScreenState createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  bool hideMessage = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(25)),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.scaleHeight(150),
          ),
          Visibility(
            child: LimitWidget(
              message: 'Your daily limit has been reached',
              onTap: () {
                setState(() {
                  hideMessage = false;
                });
              },
            ),
            visible: (SharedPrefController()
                .getUser()
                .dayLimit <=
                ActionsGetxController.to.totalExpenses) &&
                hideMessage,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(50),
          ),
          Container(
            width: SizeConfig.scaleHeight(260),
            height: SizeConfig.scaleHeight(260),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.SHADOW_COLOR,
                  offset: Offset(0, SizeConfig.scaleHeight(13)),
                  blurRadius: SizeConfig.scaleHeight(11),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: CircularPercentIndicator(
              circularStrokeCap: CircularStrokeCap.round,

              reverse: false,
              startAngle: 180,
              radius: SizeConfig.scaleHeight(259.6),
              lineWidth: 10.0,
              percent: getPercent,
              restartAnimation: true,
              progressColor: SharedPrefController()
                  .getUser()
                  .dayLimit > ActionsGetxController.to.totalExpenses
                  ? AppColors.PRIMARY_COLOR
                  : Colors.red.shade900,
              backgroundColor: Colors.white,
              animation: true,
              onAnimationEnd: () {},
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_COLOR,
                            fontSize: SizeConfig.scaleTextFont(18),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: (ActionsGetxController.to.totalExpenses
                              .toString()),
                          style: TextStyle(
                            color: AppColors.PRIMARY_TEXT_COLOR,
                            fontFamily: 'Montserrat',
                            fontSize: SizeConfig.scaleTextFont(40),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(0.3),
                  ),
                  AppText(
                    text: AppLocalizations.of(context)!.spent_today,
                    color: AppColors.PRIMARY_TEXT_COLOR,
                    fontsize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(13),
                  ),
                  Divider(
                    indent: SizeConfig.scaleWidth(33),
                    endIndent: SizeConfig.scaleWidth(33),
                    color: AppColors.SHADOW_COLOR,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(11),
                  ),
                  AppText(
                    text: AppLocalizations.of(context)!.balance_for_today,
                    color: AppColors.GRAY_COLOR,
                    fontsize: SizeConfig.scaleTextFont(16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.scaleHeight(6),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: ("\$  "),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(13),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                        TextSpan(
                          text:
                          (ActionsGetxController.to.totalIncome.toString()),
                          style: TextStyle(
                            color: Color(0xff00BEA1),
                            fontSize: SizeConfig.scaleTextFont(23.1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                bottom: SizeConfig.scaleHeight(25),
                top: SizeConfig.scaleHeight(40)),
            alignment: AlignmentDirectional.centerStart,
            child: AppText(
              text:AppLocalizations.of(context)!.last_actions,
              fontWeight: FontWeight.bold,
              fontsize: SizeConfig.scaleTextFont(20),
              color: AppColors.PRIMARY_TEXT_COLOR,
            ),
          ),
          lastOperation.isNotEmpty
              ? Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(SizeConfig.scaleHeight(8)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, SizeConfig.scaleHeight(5)),
                      blurRadius: SizeConfig.scaleHeight(18),
                      spreadRadius: 0,
                      color: AppColors.SHADOW_COLOR,
                    )
                  ]),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(
                        left: SizeConfig.scaleWidth(12),
                        right: SizeConfig.scaleWidth(12),
                        top: SizeConfig.scaleHeight(10),
                        bottom: SizeConfig.scaleHeight(27),
                      ),
                      itemCount: lastOperation.length,
                      separatorBuilder:
                          (BuildContext context, int index) {
                        return Divider(
                          height: 0,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return ActionWidget(
                          onTap: () {},
                          operation: lastOperation[index],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.scaleWidth(15),
                        vertical: SizeConfig.scaleHeight(25)),
                    child: AppElevatedButton(
                        text: AppLocalizations.of(context)!.see_more,
                        onPressed: () {
                          navigationToActionScreen(context: context);
                        }),
                  )
                ],
              ),
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  navigationToActionScreen({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ActionsScreen()));
  }

  List<Operation> get lastOperation {
    return ActionsGetxController.to.getTheLastActions();
  }

  double get getPercent {
    if (ActionsGetxController.to.totalExpenses > SharedPrefController()
        .getUser()
        .dayLimit && ActionsGetxController.to.totalExpenses != 0) {
      return 0.99;
    }
    return ActionsGetxController.to.totalExpenses / SharedPrefController().getUser().dayLimit;
  }
}
