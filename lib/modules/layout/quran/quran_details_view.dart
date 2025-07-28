import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/assets.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/models/sura_data_model.dart';

class QuranDetailsView extends StatefulWidget {
  static const String routeName = 'quran_details';

  const QuranDetailsView({super.key});

  @override
  State<QuranDetailsView> createState() => _QuranDetailsViewState();
}

class _QuranDetailsViewState extends State<QuranDetailsView> {
  List<String> versesList = [];

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as SuraDataModel;

    if (versesList.isEmpty) loadDataFromAsset(data.suraId);
    return Scaffold(
      backgroundColor: ColorsPallete.quranDetailsColor,
      appBar: AppBar(centerTitle: true, title: Text(data.suraNameEn)),
      body: Stack(
        alignment: Alignment.center,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.suraNameAr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorsPallete.primaryColor,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, int index) {
                    return Text(
                      "${versesList[index]} [${index + 1}]",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: ColorsPallete.primaryColor,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 4);
                  },
                  itemCount: versesList.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadDataFromAsset(String suraId) async {
    String content = await rootBundle.loadString('assets/files/$suraId.txt');

    versesList = content.split("\n");
    setState(() {});
    print(versesList.length);
    print(content);
  }
}
