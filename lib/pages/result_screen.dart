import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/buy_token.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/data/repo/wallet_connector.dart';
import 'package:quiz_cash/pages/quiz_home_screen.dart';
import 'package:quiz_cash/pages/welcome_Screen.dart';
import 'package:quiz_cash/widgets/button_item.dart';

class ResultScreen extends StatefulWidget {
  var totalQuestions;
  var wrongAnswers;
  var correctAnswers;
  ResultScreen(
      {required this.connector,
      required this.totalQuestions,
      required this.wrongAnswers,
      required this.correctAnswers,
      Key? key})
      : super(key: key);

  WalletConnector connector;
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
                                SizedBox(height: 60.h),
                                const Text(
                                  "Total Questions : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                                SizedBox(height: 60.h),
                                Text(
                                  "${widget.totalQuestions}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                              ])
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(height: 60.h),
                                const Text(
                                  "Correct Answers : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                                SizedBox(height: 60.h),
                                Text(
                                  "${widget.correctAnswers}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                              ])
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                SizedBox(height: 60.h),
                                const Text(
                                  "Wrong Answers : ",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
                                SizedBox(height: 60.h),
                                Text(
                                  "${widget.wrongAnswers}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 60.h),
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
