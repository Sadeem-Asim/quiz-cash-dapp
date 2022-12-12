import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/bottom_tab_bar.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/quiz_home_screen.dart';
import 'package:quiz_cash/pages/quiz_page.dart';
import 'package:quiz_cash/widgets/action_button.dart';
import 'package:quiz_cash/widgets/button_item.dart';
import 'package:quiz_cash/widgets/token_text_field.dart';

class BuyTokenScreen extends StatefulWidget {
  const BuyTokenScreen({Key? key}) : super(key: key);

  @override
  State<BuyTokenScreen> createState() => _BuyTokenScreenState();
}

class _BuyTokenScreenState extends State<BuyTokenScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/background2.png",
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const BackButton(),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 280.w,
                      height: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                        ),
                        border:
                            Border.all(color: AppColors.greenColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greenColor,
                            offset: const Offset(
                              2.5,
                              2.5,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
                          const Text(
                            "Buy Token",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 80.h),
                          const TokenTextField(
                            hintText: 'Enter Token',
                          ),
                          SizedBox(height: 24.h),
                          ButtonWidget(
                              height: 55,
                              width: double.infinity,
                              ontap: () {},
                              title: "Buy"),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: const Color(0xffc9eecd),
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90.h,
                ),
                ButtonWidget(
                  height: 55,
                  width: 130,
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomTabBar()));
                  },
                  title: "Proceed",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
