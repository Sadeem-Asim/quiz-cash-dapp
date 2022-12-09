import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/bottom_tab_bar.dart';

import 'constants/colors.dart';

class CustomizedProfile extends StatefulWidget {
  const CustomizedProfile({Key? key}) : super(key: key);

  @override
  State<CustomizedProfile> createState() => _CustomizedProfileState();
}

class _CustomizedProfileState extends State<CustomizedProfile> {
  bool valueTrue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.h,
              ),
              Image.asset(
                "assets/images/gender.png",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "Customize your profile",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                height: 55.h,
                width: 310.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.btnGreenColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            valueTrue = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 47.h,
                          width: 146.w,
                          decoration: BoxDecoration(
                            color: valueTrue
                                ? AppColors.btnGreenColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: valueTrue
                                  ? AppColors.borderColor
                                  : Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              color: valueTrue ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            setState(() {
                              valueTrue = false;
                            });
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 146.w,
                          decoration: BoxDecoration(
                            color: valueTrue
                                ? Colors.transparent
                                : AppColors.btnGreenColor,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: valueTrue
                                  ? Colors.transparent
                                  : AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "Female",
                            style: TextStyle(
                              color: valueTrue ? Colors.black : Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                height: 55.h,
                width: 312.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: green,
                    width: 2,
                  ),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Your Name go here",
                    hintStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomTabBar(),
                    ),
                  );
                },
                child: Container(
                  height: 55.h,
                  width: 166.w,
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xff39D98A),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                          Image.asset(
                            "assets/images/arrow-right.png",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
