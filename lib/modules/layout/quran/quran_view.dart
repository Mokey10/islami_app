import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/modules/layout/quran/widgets/recently_sura_widget.dart';
import 'package:islami_app/modules/layout/quran/widgets/sura_list_widget.dart'; // مهم

import '../../../core/constants/assets.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

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
            SizedBox(height: 20),
            RecentlySuraWidget(),
            SizedBox(height: 10),
            SuraListWidget(),
          ],
        ),
      ),
    );
  }
}
