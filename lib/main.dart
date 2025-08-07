import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/theme_manager.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/modules/layout/quran/quran_details_view.dart';

import 'modules/layout/layoutView.dart';
import 'modules/splash/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.themeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (BuildContext context) => const SplashView(),
        LayoutView.routeName: (BuildContext context) => const LayoutView(),
        QuranDetailsView.routeName: (BuildContext context) =>
            QuranDetailsView(),
      },
    );
  }
}
