import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/constants/colors.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final double width;

  const ActionButton({Key? key, required this.text, this.width = 122})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width.w,
      height: 43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          35,
        ),
        color: greenButton,
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
