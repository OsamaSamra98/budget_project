import 'package:budget_planner_project/Database/controllers/user_db_controller.dart';
import 'package:budget_planner_project/Screens/Bincode_Screen.dart';
import 'package:budget_planner_project/Screens/currency_Screen.dart';
import 'package:budget_planner_project/Screens/successcreate.dart';
import 'package:budget_planner_project/models/currency.dart';
import 'package:budget_planner_project/models/user.dart';
import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/helpers.dart';
import 'package:budget_planner_project/utils/main_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
    with Helpers {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  Currency? currency;
  late TextEditingController dayLimitTextController;
  String? binCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    dayLimitTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameTextController.dispose();
    emailTextController.dispose();
    dayLimitTextController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                'Get Started',
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
                'It only takes a minute to start taking hold of your finances',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.scaleTextFont(15),
                    color: Color(0XFF7B7C98)),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(21),
              ),
              Container(
                //height: SizeConfig.scaleHeight(344),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.25),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.scaleWidth(15),
                      vertical: SizeConfig.scaleHeight(22)),
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.scaleHeight(47),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name:',
                              style: TextStyle(
                                  color: Color(0xff181819),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.scaleHeight(24)),
                                child: TextField(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.right,
                                  controller: nameTextController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: SizeConfig.scaleTextFont(15),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF7B7C98)),
                                    hintText: ('None'),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        height: SizeConfig.scaleHeight(1),
                      ),
                      Row(
                        children: [
                          Text(
                            'Email Address:',
                            style: TextStyle(
                                color: Color(0xff181819),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: TextField(
                              textDirection: TextDirection.ltr,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.end,
                              controller: emailTextController,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(15),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B7C98)),
                                hintText: ('None'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(thickness: 1, height: SizeConfig.scaleHeight(23)),
                      MainContainerWidget(
                        title: ('currency'),
                        value: currency == null ? '' : currency!.nameEn,
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
                      Divider(thickness: 1, height: SizeConfig.scaleHeight(10)),
                      Row(
                        children: [
                          Text(
                            'Daily limit',
                            style: TextStyle(
                                color: Color(0xff181819),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: TextField(
                              controller: dayLimitTextController,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: SizeConfig.scaleTextFont(15),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7B7C98)),
                                hintText: ('\$ 5000'),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.scaleWidth(7),
                          ),
                        ],
                      ),
                      Divider(thickness: 1, height: SizeConfig.scaleHeight(10)),
                      MainContainerWidget(
                          title: 'set your pin',
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
                          }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.scaleHeight(90),
              ),
              ElevatedButton(
                child: Text('Create Account'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFF472FC8),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                onPressed: () async {
                  await performRegister();
                },
              ),
            ],
          ),
        ));
  }

  Future<void> performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  register() async {
    User newUser = user;
    int newUserId = await UserDbController().create(newUser);
    if (newUserId != 0) {
      newUser.id = newUserId;
      showSnackBar(context, message: 'Account Created Successfully!');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => successcreate_Screen(),
          ));
    }
  }

  bool checkData() {
    if (nameTextController.text.isNotEmpty &&
        emailTextController.text.isNotEmpty &&
        dayLimitTextController.text.isNotEmpty &&
        binCode != null &&
        currency != null) {
      return true;
    }

    showSnackBar(context, message: 'empty_field_error', error: true);
    return false;
  }

  User get user {
    User user = User();
    user.name = nameTextController.text;
    user.email = emailTextController.text;
    user.dayLimit = double.parse(dayLimitTextController.text);
    user.pin = int.parse(binCode!);
    user.currencyId = currency!.id;
    return user;
  }
}
