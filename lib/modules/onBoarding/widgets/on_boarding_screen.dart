import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/core/constants/strings.dart';
import 'package:islami_app/models/on_boarding_data_model.dart';
import 'package:islami_app/modules/layout/layoutView.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/assets.dart';
import 'dot_indicator.dart';
import 'on_boarding_page_widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = 'onBoarding-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsPallete.quranDetailsColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Assets.headerLogo,
              height: mediaQuerySize.height * 0.25,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: OnBoardingData.onBoardingList.length,
              itemBuilder: (context, index) => OnBoardingPage(
                onBoardingData: OnBoardingData.onBoardingList[index],
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: currentIndex != 0
                        ? () {
                            pageController.animateToPage(
                              OnBoardingData.onBoardingList.length - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            );
                          }
                        : null,
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsPallete.primaryColor,
                      backgroundColor: Colors.transparent,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: currentIndex != 0
                        ? Text(Strings.back)
                        : SizedBox.shrink(),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == 4) {
                        _seenOnBoarding();
                      }
                      pageController.animateToPage(
                        currentIndex + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsPallete.primaryColor,
                      backgroundColor: Colors.transparent,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(
                      currentIndex == 4 ? Strings.finish : Strings.next,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnBoardingData.onBoardingList.length,
                  (index) => DotIndicator(isActive: index == currentIndex),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _seenOnBoarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("firstTime", false);
    Navigator.pushNamed(context, LayoutView.routeName);
  }
}
