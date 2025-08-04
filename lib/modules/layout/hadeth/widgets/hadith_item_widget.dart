import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

import '../../../../core/constants/assets.dart';

class HadithItemWidget extends StatelessWidget {
  const HadithItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(Assets.hadithCardBackground)),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.vectorLeftIcn, height: 90, width: 90),
                    Image.asset(Assets.vectorRightIcn, height: 90, width: 90),
                  ],
                ),
              ),
              Image.asset(Assets.mosqueImg),
            ],
          ),
        ],
      ),
    );
  }
}
