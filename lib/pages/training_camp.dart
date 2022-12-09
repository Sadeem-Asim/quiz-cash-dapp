import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'constants/colors.dart';

class TraningCenter extends StatefulWidget {
  const TraningCenter({super.key});

  @override
  State<TraningCenter> createState() => _TraningCenterState();
}

class _TraningCenterState extends State<TraningCenter> {
  bool valueTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_white.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    BackButton(),
                    Text(
                      "Gold Mining Camp",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/goldbar.png",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "1/10",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                LinearPercentIndicator(
                  barRadius: Radius.circular(8),
                  animation: true,
                  lineHeight: 16.0,
                  animationDuration: 2500,
                  width: 350,
                  percent: 0.3,
                  backgroundColor: Colors.grey.shade300,
                  progressColor: AppColors.yellowColor,
                ),
                const SizedBox(
                  height: 60,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 270,
                      width: 360,
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
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 35),
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
                                        : Image.asset(
                                            "assets/images/false.png"),
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
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
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
      ),
    );
  }
}
