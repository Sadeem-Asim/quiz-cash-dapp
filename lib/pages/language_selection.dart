import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/customize_profile_screen.dart';
import 'package:quiz_cash/widgets/language_selection_cart.dart';

class LanguageSelection extends StatefulWidget {
  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  bool england = false;

  bool indonesia = false;

  bool spain = false;

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
            children: [
              SizedBox(
                height: 140.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "Choose Your Preferred \n Language",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    england = true;
                    indonesia = false;
                    spain = false;
                  });
                },
                child: LanguageSelectionCart(
                    image: "assets/images/england.png",
                    countryName: "England",
                    value: england,
                    onChange: (val) {}),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    england = false;
                    indonesia = true;
                    spain = false;
                  });
                },
                child: LanguageSelectionCart(
                    image: "assets/images/indonesia.png",
                    countryName: "Indonesia",
                    value: indonesia,
                    onChange: (val) {}),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    england = false;
                    indonesia = false;
                    spain = true;
                  });
                },
                child: LanguageSelectionCart(
                    image: "assets/images/spain.png",
                    countryName: "Spanish",
                    value: spain,
                    onChange: (val) {}),
              ),
              SizedBox(
                height: 130.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomizedProfile(),
                    ),
                  );
                },
                child: Container(
                  height: 55.h,
                  width: 136.w,
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
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Next",
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
