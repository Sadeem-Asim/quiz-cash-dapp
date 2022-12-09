import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/constants/colors.dart';

class LanguageSelectionCart extends StatefulWidget {
  final String image;
  final String countryName;
  final bool value;
  final ValueChanged<bool?>? onChange;

  const LanguageSelectionCart(
      {required this.image,
      required this.countryName,
      required this.value,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  State<LanguageSelectionCart> createState() => _LanguageSelectionCartState();
}

class _LanguageSelectionCartState extends State<LanguageSelectionCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset(
                  widget.image,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  widget.countryName,
                  style: TextStyle(
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            shape: const CircleBorder(),
            fillColor: MaterialStateProperty.resolveWith((states) => green),
            value: widget.value,
            onChanged: widget.onChange,
          ),
        ],
      ),
    );
  }
}