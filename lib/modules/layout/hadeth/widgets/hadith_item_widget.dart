import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/hadith_data_model.dart';

import '../../../../core/constants/assets.dart';

class HadithItemWidget extends StatelessWidget {
  const HadithItemWidget({super.key, required this.hadithDataModel});

  final HadithDataModel hadithDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
        // image: DecorationImage(image: AssetImage(Assets.hadithCardBackground),),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                Assets.hadithCardBackground,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.hadithLeftCorner, height: 90, width: 90),
                    Image.asset(
                      Assets.hadithRightCorner,
                      height: 90,
                      width: 90,
                    ),
                  ],
                ),
              ),
              Image.asset(Assets.mosqueImg),
            ],
          ),
          ListView(
            children: [
              Text(
                hadithDataModel.hadithTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Janna',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  hadithDataModel.hadithContent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Janna',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
