import 'package:islami_app/core/constants/strings.dart';

import '../core/constants/assets.dart';

class OnBoardingData {
  String imagePath;
  String title;
  String? description;

  OnBoardingData({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      imagePath: Assets.onBoarding1Img,
      title: Strings.onBoarding1Title,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding2Img,
      title: Strings.onBoarding2Title,
      description: Strings.onBoarding2Description,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding3Img,
      title: Strings.onBoarding3Title,
      description: Strings.onBoarding3Description,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding4Img,
      title: Strings.onBoarding4Title,
      description: Strings.onBoarding4Description,
    ),
    OnBoardingData(
      imagePath: Assets.onBoarding5Img,
      title: Strings.onBoarding5Title,
      description: Strings.onBoarding5Description,
    ),
  ];
}
