import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/widgets/action_button.dart';

class NextAlertDialog extends StatelessWidget {
  const NextAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/background_alert.png",
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/Group.png",
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                textAlign: TextAlign.center,
                "It is a long established fact that a reader will be distracted by the readabl"
                "e content when looking at its layout.",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
              const ActionButton(
                text: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
