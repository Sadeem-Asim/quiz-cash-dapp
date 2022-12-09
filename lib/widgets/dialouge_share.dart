import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/constants/colors.dart';

class DialougeScreen extends StatelessWidget {
  const DialougeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 280.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5).r,
                    border: Border.all(color: AppColors.borderColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.borderColor,
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
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
                        ),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30.sp,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text:
                                    'Download and get ewwards instantly, I’ve just   nd get ewwards  my cash out! Come and join my team with a click:',
                              ),
                              TextSpan(
                                text: ' https:xyz.com/sgt',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ),
                      InkWell(
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              "Copy",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/whatsapp.png"),
                              Image.asset("assets/images/messenger.png"),
                              Image.asset("assets/images/skype.png"),
                              Image.asset("assets/images/twiter.png"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.white,
                    child: Image.asset(
                      "assets/images/black_curve.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
