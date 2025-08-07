import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/sura_data_model.dart';

import '../../../../core/constants/assets.dart';

class RecentlyItemWidget extends StatelessWidget {
  const RecentlyItemWidget({super.key, required this.suraDataModel});

  final SuraDataModel suraDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 285,
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsPallete.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                suraDataModel.suraNameEn,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                suraDataModel.suraNameAr,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                suraDataModel.suraVersesNumber,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.black),
              ),
            ],
          ),
          Expanded(child: Image.asset(Assets.cardLogo)),
        ],
      ),
    );
  }
}
