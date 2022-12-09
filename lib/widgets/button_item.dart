import 'package:flutter/material.dart';

import '../pages/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback ontap;
  final String title;

  const ButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.black26,
          // ),
          color: AppColors.btnGreenColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title.toString(),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
