import 'package:flutter/material.dart';
import '../pages/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceContainer extends StatelessWidget {
  final String count;
  final String title;

  const PriceContainer({Key? key, required this.count, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: lightGreyContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style:  TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff6D7580),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
