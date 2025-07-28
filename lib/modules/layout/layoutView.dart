import 'package:flutter/material.dart';
import 'package:islami_app/modules/layout/hadeth/hadeth_view.dart';

import '../../core/constants/assets.dart';
import 'quran/quran_view.dart';
import 'radio/radio_view.dart';
import 'tasbeh/tasbeh_view.dart';
import 'time/time_view.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = '/layout';

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.quranIcn)),
            label: 'Quran',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ImageIcon(
                AssetImage(Assets.quranIcn),
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.hadethIcn)),
            label: 'Hadeth',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ImageIcon(
                AssetImage(Assets.hadethIcn),
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.tasbehIcn)),
            label: 'Tasbeh',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ImageIcon(
                AssetImage(Assets.tasbehIcn),
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.radioIcn)),
            label: 'Radio',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ImageIcon(
                AssetImage(Assets.radioIcn),
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.timeIcn)),
            label: 'Timer',
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ImageIcon(AssetImage(Assets.timeIcn), color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
