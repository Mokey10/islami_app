import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadith_data_model.dart';
import 'package:islami_app/modules/layout/hadeth/widgets/hadith_item_widget.dart';

import '../../../core/constants/assets.dart';

class HadethView extends StatefulWidget {
  const HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  @override
  Widget build(BuildContext context) {
    if (hadithDataList.isEmpty) {
      loadHadithData();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.hadethBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Image.asset(Assets.headerLogo),
          Expanded(
            child: CarouselSlider(
              items: hadithDataList.map((e) {
                return HadithItemWidget(hadithDataModel: e);
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.6,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<HadithDataModel> hadithDataList = [];

  void loadHadithData() async {
    String content = await rootBundle.loadString('assets/files/ahadith.txt');
    List<String> allHadithList = content.split('#');
    for (var element in allHadithList) {
      String singleHadith = element.trim();

      int indexOfTitle = singleHadith.indexOf('\n');

      String hadithTitle = singleHadith.substring(0, indexOfTitle);
      String hadithContent = singleHadith.substring(indexOfTitle + 1);

      HadithDataModel hadithDataModel = HadithDataModel(
        hadithTitle: hadithTitle,
        hadithContent: hadithContent,
      );
      setState(() {
        hadithDataList.add(hadithDataModel);
      });
    }
  }
}
