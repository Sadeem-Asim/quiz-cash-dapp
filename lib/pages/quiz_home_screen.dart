import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/quiz_page.dart';
import 'package:quiz_cash/pages/training_camp.dart';
import 'package:quiz_cash/widgets/action_button.dart';
import 'package:quiz_cash/widgets/price_container.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({Key? key}) : super(key: key);

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
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
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Airdrop",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        width: 80.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: 38.w,
                              height: 29.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: green,
                              ),
                              child: Image.asset("assets/images/toogle.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Image(
                  image: AssetImage("assets/images/hiding.png"),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Quiz to earn Crypto",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      width: 280.w,
                      height: 164,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              PriceContainer(
                                count: "500 M",
                                title: "AWARDS",
                              ),
                              PriceContainer(
                                count: "00:00",
                                title: "TIME",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QuizPage(),
                                  ),
                                );
                              },
                              child: const ActionButton(text: "Play Now")),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDADEE3),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff6D7580),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDADEE3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Stack(
                  children: [
                    Container(
                      width: 280.w,
                      height: 120,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/tent.png"),
                              Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Crypto Camp",
                                    style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const TraningCenter(),
                                        ),
                                      );
                                    },
                                    child: const ActionButton(
                                        text: "Quiz to Earn", width: 128),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Stack(
                  children: [
                    Container(
                      width: 280.w,
                      height: 160,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text(
                                        "Rewards Pool",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(
                                            0xff858C94,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/Union.png",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(
                            color: Color(
                              0xff858C94,
                            ),
                            indent: 14,
                            endIndent: 14,
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/management.png",
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "X5",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const ActionButton(
                                  text: "Invite to earn",
                                  width: 138,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
