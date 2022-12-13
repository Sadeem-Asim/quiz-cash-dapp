import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/constants/colors.dart';
import 'package:quiz_cash/pages/quiz_page.dart';
import 'package:quiz_cash/pages/training_camp.dart';
import 'package:quiz_cash/widgets/action_button.dart';
import 'package:quiz_cash/widgets/price_container.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'data/repo/wallet_connector.dart';

class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({required this.connector, Key? key}) : super(key: key);

  final WalletConnector connector;
  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  bool status = false;
  var tokens = 0;
  var level = 0;

  late String address = widget.connector.address;

  void initState() {
    super.initState();
    getUserData();
    setState(() {
      tokens = 0;
    });
  }

  void getUserData() async {
    print("Calling Api");
    final response = await http
        .get(Uri.parse("https://quizcash.herokuapp.com/players/get/$address"));
    var data = jsonDecode(response.body.toString());
    var player = data["player"];
    setState(() {
      tokens = player["token"];
      level = player["level"];
    });
  }

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
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                "$level",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: 38.w,
                              height: 29.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: green,
                              ),
                              child: Image.asset("assets/images/level.png"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 90.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text(
                                "$tokens",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                            Container(
                              width: 44.w,
                              height: 29.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: green,
                              ),
                              child: Image.asset("assets/images/toogle.png"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Image(
                  image: AssetImage("assets/images/hiding.png"),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Quiz to earn Crypto",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      width: 280.w,
                      height: 164,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              PriceContainer(
                                count: "Upto 2x",
                                title: "AWARDS",
                              ),
                              PriceContainer(
                                count: "05:00",
                                title: "TIME",
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                              onTap: () async {
                                if (level == 1 && tokens >= 100) {
                                  Map data = {"token": -100};
                                  var l1 = json.encode(data);
                                  final result = await http.put(
                                      Uri.parse(
                                          "https://quizcash.herokuapp.com/players/update/token/${widget.connector.address}"),
                                      headers: {
                                        "Content-Type": "application/json"
                                      },
                                      body: l1);

                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizPage(
                                          level: level,
                                          connector: widget.connector,
                                        ),
                                      ),
                                    );
                                  });
                                } else if (level == 2 && tokens >= 200) {
                                  Map data = {"token": -200};
                                  var l1 = json.encode(data);
                                  final result = await http.put(
                                      Uri.parse(
                                          "https://quizcash.herokuapp.com/players/update/token/${widget.connector.address}"),
                                      headers: {
                                        "Content-Type": "application/json"
                                      },
                                      body: l1);

                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizPage(
                                          level: level,
                                          connector: widget.connector,
                                        ),
                                      ),
                                    );
                                  });
                                } else if (level == 3 && tokens >= 300) {
                                  Map data = {"token": -300};
                                  var l1 = json.encode(data);
                                  final result = await http.put(
                                      Uri.parse(
                                          "https://quizcash.herokuapp.com/players/update/token/${widget.connector.address}"),
                                      headers: {
                                        "Content-Type": "application/json"
                                      },
                                      body: l1);

                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizPage(
                                          level: level,
                                          connector: widget.connector,
                                        ),
                                      ),
                                    );
                                  });
                                } else {
                                  print("Ather Acha Insan Hai");
                                  showAlertDialog(BuildContext context) {
                                    // set up the button
                                    Widget okButton = TextButton(
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color(0xff39d98a)),
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop("dialog");
                                      },
                                    );

                                    // set up the AlertDialog
                                    AlertDialog alert = AlertDialog(
                                      title: Text("Not Enough Tokens"),
                                      content: Text(
                                          "Please Buy More Tokens On Our Website To Play"),
                                      actions: [
                                        okButton,
                                      ],
                                    );

                                    // show the dialog
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                  }

                                  showAlertDialog(context);
                                }
                              },
                              child: const ActionButton(text: "Play Now")),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDADEE3),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff6D7580),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffDADEE3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Stack(
                  children: [
                    Container(
                      width: 280.w,
                      height: 200,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Text(
                                        "Rewards Pool",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(
                                            0xff858C94,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/Union.png",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(
                            color: Color(
                              0xff858C94,
                            ),
                            indent: 14,
                            endIndent: 14,
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/management.png",
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      "X5",
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () => launchUrl(
                                      Uri.parse('https://quizbox-buy.netlify.app/')),
                                  child: const ActionButton(
                                    text: "Buy/Claim",
                                    //   width: 138,
                                  ),
                                ),
                                // const ActionButton(
                                //   text: "Buy/Claim",
                                //   width: 138,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/green_curve.png",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
