import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/bottom_tab_bar.dart';
import 'package:quiz_cash/pages/mining_first.dart';
import 'package:quiz_cash/pages/mining_second.dart';
import 'package:quiz_cash/pages/splash_screen.dart';
import 'package:quiz_cash/pages/training_camp.dart';
import 'package:quiz_cash/pages/training_camp_first.dart';
import 'package:quiz_cash/pages/wallet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quiz Cash',
          theme: ThemeData(
            fontFamily: "poppins",
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
