import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';
import 'package:islami_app/core/constants/strings.dart';

import '../../../core/constants/assets.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView> {
  List<String> tasbehList = ["الحمد لله", "الله اكبر", "سبحان الله"];
  late String tasbehTitle = tasbehList[0];
  int counter = 0;
  double turns = 0;
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.headerLogo, height: mediaQuerySize.height * 0.25),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.zekrHeader,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: ColorsPallete.titleColor,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(),
                Image.asset(
                  Assets.sebhaHead,
                  height: mediaQuerySize.height * 0.12,
                ),
                Positioned.fill(
                  top: mediaQuerySize.height * 0.09,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          turns: turns,
                          duration: Duration(milliseconds: 500),
                          child: InkWell(
                            onTap: () {
                              _updateTasbeh();
                            },
                            child: Image.asset(
                              Assets.sebhaBody,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(),
                            Text(
                              tasbehTitle,
                              style: TextStyle(
                                fontSize: 36,
                                color: ColorsPallete.titleColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                fontSize: 36,
                                color: ColorsPallete.titleColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 32),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateTasbeh() {
    counter++;
    turns = turns + (pi / 33);
    if (counter == 34) {
      tasbehTitle = tasbehList[(tasbehTitle.indexOf(tasbehTitle) + 1) % 3];
      counter = 0;
    }
    setState(() {});
  }
}
