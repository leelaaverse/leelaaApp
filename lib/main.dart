import 'package:flutter/material.dart';
import 'package:leelaah/utils/global.dart';
import 'package:leelaah/utils/shared_preferences_handler.dart';

import 'auth/screen/splash.dart';
import 'constants/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHandler().init();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.appColor,),
      ),
      home: SplashScreen(),
    );
  }
}