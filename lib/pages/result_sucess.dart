import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/buy_token.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/data/repo/wallet_connector.dart';
import 'package:quiz_cash/pages/quiz_home_screen.dart';
import 'package:quiz_cash/pages/welcome_Screen.dart';
import 'package:quiz_cash/widgets/button_item.dart';

class ResultSuccessScreen extends StatefulWidget {
  var reward;
  ResultSuccessScreen({required this.connector, required this.reward, Key? key})
      : super(key: key);

  WalletConnector connector;
  @override
  State<ResultSuccessScreen> createState() => _ResultSuccessScreenState();
}

class _ResultSuccessScreenState extends State<ResultSuccessScreen> {
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.h),
                          const Text(
                            "Quiz Result",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(height: 30.h),
                                const Text(
                                  "       Congratulations ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 30.h),
                              ]),
                              Row(children: [
                                SizedBox(height: 60.h),
                                const Text(
                                  "          Reward : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                                SizedBox(height: 60.h),
                                Text(
                                  "${widget.reward}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                              ]),
                              Row(children: [
                                SizedBox(height: 60.h),
                                const Text(
                                  "Claim Your Result On Our Website",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                              ]),
                              Row(children: [
                                SizedBox(height: 30.h),
                                const Text(
                                  "          ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 30.h),
                              ])
                            ],
                          ),
                          ButtonWidget(
                              height: 55,
                              width: double.infinity,
                              ontap: () async {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        QuizHomeScreen(
                                            connector: widget.connector),
                                  ),
                                );
                              },
                              title: "Return To Home Page"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
