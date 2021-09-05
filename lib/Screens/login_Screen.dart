import 'package:budget_planner_project/Database/controllers/user_db_controller.dart';
import 'package:budget_planner_project/models/user.dart';
import 'package:budget_planner_project/storge/shared_pref_controller.dart';
import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/app_textfield.dart';
import 'package:budget_planner_project/utils/helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class login_Screen extends StatefulWidget {
  @override
  _login_ScreenState createState() => _login_ScreenState();
}

class _login_ScreenState extends State<login_Screen> with Helpers {
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: SizeConfig.scaleHeight(81),
            ),
            Container(
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
            SizedBox(
              height: SizeConfig.scaleHeight(13),
            ),
            Text(
              AppLocalizations.of(context)!.login,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.scaleTextFont(20),
                  color: Color(0XFF0D0E56)),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(11),
            ),
            Text(
              AppLocalizations.of(context)!.login_msg,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.scaleTextFont(15),
                  color: Color(0XFF7B7C98)),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(50),
            ),
            app_textfield(
              title: AppLocalizations.of(context)!.email,
              controller: _emailEditingController,
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(15),
            ),
            app_textfield(
              title: AppLocalizations.of(context)!.pin,
              secure: true,
              controller: _passwordEditingController,
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(30),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: SizeConfig.scaleWidth(20),
                  right: SizeConfig.scaleWidth(20),
                  bottom: SizeConfig.scaleHeight(15)),
              child: ElevatedButton(
                onPressed: () async {
                  await performLogin();
                },
                child: Text(AppLocalizations.of(context)!.login),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFF472FC8),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(50)),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.create_account_question,
                    style: TextStyle(
                      color: Color(0XFF7B7C98),
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/CreateAccountScreen');
                      },
                      child: Text(
                        AppLocalizations.of(context)!.create_account,
                        style: TextStyle(
                          color: Color(0XFF351DB6),
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context,
      message: 'Enter Required Data',
      error: true,
    );

    return false;
  }

  Future login() async {
    User? user = await UserDbController().login(
        email: _emailEditingController.text,
        pin: _passwordEditingController.text);
    if (user != null) {
      showSnackBar(context, message: 'login_successfully');
      SharedPrefController().save(user);
      Navigator.pushNamedAndRemoveUntil(
          context, '/main_Screen', (route) => false);
    } else {
      showSnackBar(context, message: 'invalid_email_or_pin', error: true);
    }
  }

  void clear() {
    _passwordEditingController.text = '';
    _emailEditingController.text = '';
  }
}
