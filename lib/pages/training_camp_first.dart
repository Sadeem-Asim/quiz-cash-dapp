import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrainigCampFirst extends StatelessWidget {
  const TrainigCampFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg_white.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 170.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xff45bf5d),
                      Color(0xff88db94),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          BackButton(),
                          Text(
                            "Gold Mining Camp",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Answer 10 Questions\n Correctly, Earn Gold \nEasily",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/image1.png"),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/image2.png"),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/image3.png"),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 30),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Practice to earn! Answer 10 Questions Correctly, Earn Goold easily! Come And Join Me-',
                              ),
                              TextSpan(
                                text: ' Join Me-',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      ),
                      Image.asset("assets/images/man.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
