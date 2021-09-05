
import 'package:budget_planner_project/Database/controllers/user_db_controller.dart';
import 'package:budget_planner_project/Screens/Bincode_Screen.dart';
import 'package:budget_planner_project/getx/currency_getx_controller.dart';
import 'package:budget_planner_project/models/currency.dart';
import 'package:budget_planner_project/models/user.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/utils/AppColors.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_elevated_button.dart';
import 'package:budget_planner_project/utils/create_account_text_filed.dart';
import 'package:budget_planner_project/utils/header_widget.dart';
import 'package:budget_planner_project/utils/helpers.dart';
import 'package:budget_planner_project/utils/main_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../currency_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with Helpers {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController dayLimitTextController;
  Currency? currency;
  String? binCode;

  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    dayLimitTextController = TextEditingController();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    dayLimitTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: SizeConfig.scaleHeight(103)),
        child: Column(
          children: [
            HeaderWidget(user.name, 'profile'),
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(15)),
              margin: EdgeInsets.all(SizeConfig.scaleHeight(20)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(SizeConfig.scaleHeight(25)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, SizeConfig.scaleHeight(10)),
                    color: AppColors.SHADOW_COLOR,
                    blurRadius: SizeConfig.scaleHeight(18),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CreateAccountTextField(
                    controller: nameTextController,
                    hint: user.name,
                    prefix: AppLocalizations.of(context)!.name,
                  ),
                  Divider(
                    height: 0,
                    color: AppColors.GRAY_COLOR,
                  ),
                  CreateAccountTextField(
                    controller: emailTextController,
                    hint: user.email,
                    inputType: TextInputType.emailAddress,
                    prefix: AppLocalizations.of(context)!.email ,
                  ),
                  Divider(
                    height: 0,
                    color: AppColors.GRAY_COLOR,
                  ),
                  MainContainerWidget(
                    title: AppLocalizations.of(context)!.currency,
                    value: currency == null
                        ? CurrencyGetxController.to
                            .getCurrencyName(user.currencyId)
                        : currency!.nameEn,
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
                  Divider(
                    height: 0,
                    color: AppColors.GRAY_COLOR,
                  ),
                  CreateAccountTextField(
                    controller: dayLimitTextController,
                    hint: user.dayLimit.toString(),
                    prefix: AppLocalizations.of(context)!.daily_limit,
                    inputType: TextInputType.number,
                  ),
                  Divider(
                    height: 0,
                    color: AppColors.GRAY_COLOR,
                  ),
                  MainContainerWidget(
                    title: AppLocalizations.of(context)!.change_your_pin,
                    value: binCode,
                    iconData: Icons.arrow_forward_ios,
                    onTap: () async {
                      String code = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BinCodeScreen(),
                        ),
                      );
                      setState(() {
                        binCode = code;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(35)),
              child: AppElevatedButton(
                text: AppLocalizations.of(context)!.save,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
                fontSize: SizeConfig.scaleTextFont(15),
                onPressed: () async {
                  await performSave();
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  User get user {
    User user = SharedPrefController().getUser();
    return user;
  }

  Future<void> performSave() async {
    bool updated = await UserDbController().update(userUpdated);
    if (updated) {
      SharedPrefController().save(userUpdated);
      showSnackBar(context, message: 'Account Updated Successfully!');
      clearFields();
    } else {
      showSnackBar(context, message: 'Account Updated Field!');
    }
  }

  User get userUpdated {
    User updatedUser = user;
    updatedUser.name = nameTextController.text.isNotEmpty
        ? nameTextController.text
        : user.name;
    updatedUser.dayLimit = dayLimitTextController.text.isNotEmpty
        ? double.parse(dayLimitTextController.text)
        : user.dayLimit;
    updatedUser.email = emailTextController.text.isNotEmpty
        ? emailTextController.text
        : user.email;
    updatedUser.currencyId = currency == null ? user.currencyId : currency!.id;
    updatedUser.pin = binCode == null ? user.pin : int.parse(binCode!);
    return updatedUser;
  }

  void clearFields() {
    nameTextController.text = '';
    dayLimitTextController.text = '';
    emailTextController.text = '';
  }
}
