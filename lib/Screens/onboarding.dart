import 'package:budget_planner_project/styles/my_icon.dart';
import 'package:budget_planner_project/utils/SizeConfig.dart';
import 'package:budget_planner_project/utils/on_boarding_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class onboarding_Screen extends StatefulWidget {
  const onboarding_Screen({Key? key}) : super(key: key);

  @override
  _onboarding_ScreenState createState() => _onboarding_ScreenState();
}

class _onboarding_ScreenState extends State<onboarding_Screen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.scaleWidth(108),
                vertical: SizeConfig.scaleHeight(60)),
            child: Container(
                height: SizeConfig.scaleHeight(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: LinearProgressIndicator(
                    backgroundColor: Color(0XFFF1F4FF),
                    color: Color(0XFF472FC8),
                    value: (_currentPage + 1) / 3,
                  ),
                )),
          ),
          PageView(
            controller: _pageController,
            onPageChanged: (int selectedPage) {
              setState(() {
                _currentPage = selectedPage;
              });
            },
            children: [
              onboardingcontent(
                text: 'Take hold of your finances',
                subtext: 'Managing your finances can be effortless ',
                image: 'onboarding1',
              ),
              onboardingcontent(
                text: 'See where your money goes',
                subtext:
                    'This app helps your to track your income and \n expenditure via automatic bank synchronization \n or manually ',
                image: 'onboarding2',
              ),
              onboardingcontent(
                text: 'Reach your goals with ease',
                subtext:
                    'Managing your finances can be effortless \n Budget App makes it a breeze',
                image: 'onboarding3',
                buttontext: 'Lets start',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.scaleWidth(20),
                right: SizeConfig.scaleWidth(20),
                top: SizeConfig.scaleHeight(700)),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage != 2) {
                  _pageController.nextPage(
                      duration: Duration(seconds: 1), curve: Curves.bounceIn);
                } else {
                  Navigator.pushReplacementNamed(context, '/login_Screen');
                }
              },
              child: Visibility(
                  visible: _currentPage != 2,
                  replacement: Text('Lets start'),
                  child: Text('Next')),
              style: ElevatedButton.styleFrom(
                  primary: Color(0XFF472FC8),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.scaleWidth(180),
                right: SizeConfig.scaleWidth(180),
                top: SizeConfig.scaleHeight(750)),
            child: TextButton(
              onPressed: () {
                if (_currentPage != 2) {
                  _pageController.jumpToPage(2);
                }
              },
              child: Visibility(
                visible: _currentPage != 2,
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: SizeConfig.scaleTextFont(15),
                      color: Color(0XFF7B7C98)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
