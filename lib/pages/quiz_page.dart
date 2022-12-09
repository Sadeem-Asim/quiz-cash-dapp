import 'package:flutter/material.dart';
import 'package:quiz_cash/pages/training_camp_first.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/colors.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool valueTrue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_white.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: Stack(
                children: [
                  Image.asset("assets/images/quiz_image.png"),
                  const Positioned(
                    // top: 100,
                    bottom: 10,
                    right: 130,

                    child: Text(
                      "1/10",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 50,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 270,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                      ),
                      border: Border.all(color: AppColors.greenColor, width: 2),
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
                      children: [
                        SizedBox(
                          height: 42.h,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "The Matavers is the \n bockchain. The statemeny \nis:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                print("valuetrue");
                                setState(() {
                                  valueTrue = true;
                                });
                              },
                              child: Row(
                                children: [
                                  valueTrue
                                      ? Image.asset("assets/images/true.png")
                                      : Image.asset("assets/images/false.png"),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Correct",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: valueTrue
                                          ? AppColors.greenColor
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print("valueFalse");
                                setState(() {
                                  valueTrue = false;
                                });
                              },
                              child: Row(
                                children: [
                                  valueTrue
                                      ? Image.asset("assets/images/false.png")
                                      : Image.asset("assets/images/true.png"),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "Correct",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: valueTrue
                                          ? Colors.grey
                                          : AppColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TrainigCampFirst(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 46.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                  Positioned(
                    left: 150,
                    top: -20,
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.greenColor,
                          width: 2,
                        ),
                      ),
                      child: const Text(
                        "59",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
