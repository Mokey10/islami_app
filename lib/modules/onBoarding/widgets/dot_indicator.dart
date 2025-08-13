import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/colors_pallete.dart';

class DotIndicator extends StatelessWidget {
  DotIndicator({super.key, required this.isActive});

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: 8,
      width: isActive ? 24 : 8,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? ColorsPallete.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
