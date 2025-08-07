import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/core/constants/constants.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';
import 'package:islami_app/modules/layout/quran/widgets/recently_sura_widget.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_widget.dart'; // مهم

import '../../../core/constants/assets.dart';

class QuranView extends StatefulWidget {
  QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    loadRecentData();
  }

  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.quranBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.headerLogo),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                onChanged: (value) {
                  searchQuery = value;
                  search();
                  setState(() {});
                },
                cursorColor: ColorsPallete.primaryColor,
                decoration: InputDecoration(
                  hintText: 'Sura Name',
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: ColorsPallete.primaryColor),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage(Assets.quranIcn),
                      color: ColorsPallete.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: searchQuery.isEmpty,
              replacement: SuraListWidget(
                onSuraTap: onSuraTap,
                suraDataModel: searchSuraList,
              ),
              child: Column(
                children: [
                  recentSuraList.isNotEmpty
                      ? RecentlySuraWidget(suraDataModel: recentSuraList)
                      : Center(
                          child: Text(
                            'No Recent Sura',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorsPallete.primaryColor,
                            ),
                          ),
                        ),
                  SizedBox(height: 10),
                  SuraListWidget(
                    onSuraTap: onSuraTap,
                    suraDataModel: Constants.suraDataLists,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  List<String> recentSuraIndexList = [];

  List<SuraDataModel> recentSuraList = [];

  onSuraTap(int index) {
    _cashSuraIndex(index);
    Navigator.pushNamed(
      context,
      QuranDetailsView.routeName,
      arguments: Constants.suraDataLists[index],
    );
  }

  _cashSuraIndex(int index) {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) {
      return;
    }
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);
    LocalStorageServices.setStringList(
      LocalStorageKeys.recentSuras,
      recentSuraIndexList,
    );
    loadRecentData();
    setState(() {});
  }

  loadRecentData() {
    recentSuraIndexList = [];
    recentSuraList = [];
    recentSuraIndexList =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSuras) ?? [];
    for (String index in recentSuraIndexList) {
      int indexInt = int.parse(index);
      recentSuraList.add(Constants.suraDataLists[indexInt]);
    }
  }

  List<SuraDataModel> searchSuraList = [];

  void search() {
    searchSuraList = [];
    for (var sura in Constants.suraDataLists) {
      if (sura.suraNameEn.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.suraNameAr.toLowerCase().contains(searchQuery.toLowerCase())) {
        searchSuraList.add(sura);
      }
    }
  }
}
