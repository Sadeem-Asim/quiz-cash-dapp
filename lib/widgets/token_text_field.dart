import 'package:flutter/material.dart';

import '../pages/constants/colors.dart';

class TokenTextField extends StatelessWidget {
  final String hintText;
  const TokenTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.greenColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 2,
            color: AppColors.greenColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: AppColors.greenColor,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            // color: Colors.grey,
            color: AppColors.greenColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.orange),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
