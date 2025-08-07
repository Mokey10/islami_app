import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_item.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({super.key, required this.onSuraTap});

  final void Function(int) onSuraTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sura's List", style: Theme.of(context).textTheme.bodyLarge),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (BuildContext context, int index) {
              return SuraListItem(
                onSuraTab: () => onSuraTap(index),
                suraDataModel: Constants.suraDataLists[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: Constants.suraDataLists.length,
          ),
        ],
      ),
    );
  }
}
