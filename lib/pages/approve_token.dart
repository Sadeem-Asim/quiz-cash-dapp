import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/buy_token.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/widgets/button_item.dart';
import 'package:quiz_cash/widgets/token_text_field.dart';
import "package:quiz_cash/pages/data/ethereum_connector.dart";
import 'package:web3dart/credentials.dart';
import '../pages/data/repo/wallet_connector.dart';
import 'package:erc20/erc20.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/src/client.dart';

class ApprovalTokenScreen extends StatefulWidget {
  ApprovalTokenScreen({required this.connector, Key? key}) : super(key: key);

  final WalletConnector connector;

  @override
  State<ApprovalTokenScreen> createState() => _ApprovalTokenScreenState();
}

class _ApprovalTokenScreenState extends State<ApprovalTokenScreen> {
  bool status = false;
  late String address = widget.connector.address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
              children: [
                Row(
                  children: [
                    const BackButton(),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.h,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      width: 280.w,
                      height: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(0),
                        ),
                        border:
                            Border.all(color: AppColors.greenColor, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greenColor,
                            offset: const Offset(
                              2.5,
                              2.5,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h),
                          const Text(
                            "Approve Token",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 60.h),
                          ButtonWidget(
                              height: 55,
                              width: double.infinity,
                              ontap: () async {
                                final res = await widget.connector.approve();
                                if (res) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BuyTokenScreen()));
                                }
                              },
                              title: "Approve"),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: const Color(0xffc9eecd),
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
