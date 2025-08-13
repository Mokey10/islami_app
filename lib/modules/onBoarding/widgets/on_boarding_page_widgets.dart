import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/on_boarding_data_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.onBoardingData});

  final OnBoardingData onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(onBoardingData.imagePath)),
          SizedBox(height: 24),
          Text(
            onBoardingData.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ColorsPallete.primaryColor,
            ),
          ),
          SizedBox(height: 24),
          if (onBoardingData.description != null)
            Text(
              onBoardingData.description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsPallete.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
