import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarIconButton extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  final String text;
  final VoidCallback onPress;
  final String iconImage;

  const TabBarIconButton(
      {super.key,
      required this.iconColor,
      required this.textColor,
      required this.text,
      required this.onPress,
      required this.iconImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(iconImage, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14, color: textColor),
          ),
        ],
      ),
    );
  }
}
