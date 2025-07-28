import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';
import '../layout/layoutView.dart'; // لازم تستورده عشان التنقل

class SplashView extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.splashScreen),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
