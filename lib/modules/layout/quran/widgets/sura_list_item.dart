import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';

import '../../../../core/constants/assets.dart';

class SuraListItem extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const SuraListItem({super.key, required this.suraDataModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///navigate to sura details view

        Navigator.pushNamed(
          context,
          QuranDetailsView.routeName,
          arguments: suraDataModel,
        );
      },
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.suraNumberIcn),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                suraDataModel.suraId,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                suraDataModel.suraNameEn,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
              Text(
                "${suraDataModel.suraVersesNumber} Verses",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: Colors.white),
              ),
            ],
          ),
          Spacer(),
          Text(
            suraDataModel.suraNameAr,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
