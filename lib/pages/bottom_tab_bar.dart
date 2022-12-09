import 'package:flutter/material.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/mining_second.dart';
import 'package:quiz_cash/pages/quiz_home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/wallet.dart';

import '../widgets/tab_bar_icons.dart';
import 'mining_first.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int currentIndex = 0;
  List screens = <Widget>[
    const QuizHomeScreen(),
    const MiningFirst(),
    const MiningScreenTwo(),
    const WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 64.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabBarIconButton(
                iconColor: currentIndex == 0
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                textColor: currentIndex == 0
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                text: "Quiz Cash",
                onPress: () {

                  setState(() {
                    currentIndex = 0;
                  });
                },
                iconImage: "assets/images/first.png",
              ),
              TabBarIconButton(
                iconColor: currentIndex == 1
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                textColor: currentIndex == 1
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                text: "Referral",
                onPress: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                iconImage: "assets/images/second.png",
              ),
              TabBarIconButton(
                iconColor: currentIndex == 2
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                textColor: currentIndex == 2
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                text: "Mining",
                onPress: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                iconImage: "assets/images/third.png",
              ),
              TabBarIconButton(
                iconColor: currentIndex == 3
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                textColor: currentIndex == 3
                    ? AppColors.btnGreenColor
                    : AppColors.lightGrey,
                text: "Wallet",
                onPress: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                iconImage: "assets/images/wallets.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
