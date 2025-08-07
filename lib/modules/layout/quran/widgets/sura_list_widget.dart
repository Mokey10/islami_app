import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_item.dart';

import '../../../../models/sura_data_model.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget(
      {super.key, required this.onSuraTap, required this.suraDataModel});

  final void Function(int) onSuraTap;
  final List<SuraDataModel> suraDataModel;

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
                onSuraTab: () =>
                    onSuraTap(int.parse(suraDataModel[index].suraId) - 1),
                suraDataModel: suraDataModel[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: suraDataModel.length,
          ),
        ],
      ),
    );
  }
}
