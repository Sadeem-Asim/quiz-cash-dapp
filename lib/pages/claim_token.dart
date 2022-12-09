import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/button_item.dart';
import '../widgets/token_text_field.dart';
import 'constants/colors.dart';

class ClaimTokenScreen extends StatefulWidget {
  const ClaimTokenScreen({Key? key}) : super(key: key);

  @override
  State<ClaimTokenScreen> createState() => _ClaimTokenScreenState();
}

class _ClaimTokenScreenState extends State<ClaimTokenScreen> {
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
                        fontWeight: FontWeight.w600,
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
                            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 25.h),
                          const TokenTextField(
                            hintText: 'Enter Token',
                          ),
                          SizedBox(height: 24.h),
                          ButtonWidget(
                              height: 55,
                              width: double.infinity,
                              ontap: () {},
                              title: "Buy"),
                          SizedBox(height: 24.h),
                          ButtonWidget(
                              height: 55,
                              width: double.infinity,
                              ontap: () {},
                              title: "Confirm"),
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
