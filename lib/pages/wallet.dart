import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/claim_token.dart';
import '../widgets/button_item.dart';
import 'constants/colors.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool valueTrue = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background2.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/coin.png",
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '5,000',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      alignment: Alignment.center,
                      width: 88.w,
                      height: 31.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.greenColor,
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 1.5.w,
                        ),
                      ),
                      child: Text(
                        "EXCHANGE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Wallet',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20).r,
                    border: Border.all(
                      color: AppColors.btnGreenColor,
                      width: 2.w,
                    ),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      const Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'gyts****bhd33',
                            hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: AppColors.btnGreenColor,
                        thickness: 3,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Image.asset(
                          color: Colors.black54,
                          "assets/images/gallery.png",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 24.h,
                  ),
                  child: Container(
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
                                "Token Assets",
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
                                "NFT",
                                style: TextStyle(
                                  color:
                                      valueTrue ? Colors.black : Colors.white,
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
                ),
                // const SizedBox(height: 60),
                Stack(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      height: 270.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderColor,
                            offset: const Offset(
                              2.5,
                              2.5,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/icon1.png"),
                            ),
                            title: Text(
                              'O uHGT',
                              style: TextStyle(
                                fontSize: 20.0.sp,
                              ),
                            ),
                            subtitle: const Text('Unlock Hooked Gold Token'),
                          ),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/icon2.png"),
                            ),
                            title: Text(
                              'O uHGT',
                              style: TextStyle(
                                fontSize: 20.sp,
                              ),
                            ),
                            subtitle: const Text('Unlock Hooked Gold Token'),
                          ),
                          const SizedBox(height: 10),
                          ButtonWidget(
                            height: 50.h,
                            width: 200.w,
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const ClaimTokenScreen()));
                            },
                            title: "Swap & Transfer",
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/black_curve.png",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
