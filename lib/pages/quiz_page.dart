import 'package:flutter/material.dart';
import 'package:quiz_cash/pages/data/repo/wallet_connector.dart';
import 'package:quiz_cash/pages/result_screen.dart';
import 'package:quiz_cash/pages/result_sucess.dart';
import 'package:quiz_cash/pages/training_camp_first.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/colors.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'dart:async';

class QuizPage extends StatefulWidget {
  var level;

  QuizPage({required this.level, required this.connector, super.key});
  WalletConnector connector;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> ques = [];
  List<String> answers = [];
  var questions;
  var aQuestion;
  var que;
  var option1;
  var option2;
  var option3;
  var option4;
  var optionSelected = "";
  var _start = 0;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            if (optionSelected.length == 0) optionSelected = "A";
            increment();
            startTimer();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> getQuestions() async {
    final response = await http.get(Uri.parse(
        "https://quizcash.herokuapp.com/questions/get/level/${widget.level}"));
    var data = jsonDecode(response.body.toString());
    print(data);
    setState(() {
      aQuestion = 0;
      aQuestion = "Loading";
    });
    if (response.statusCode == 200) {
      setState(() {
        questions = data["selected"];
        que = questions[0];
        _start = que["timer"];
        aQuestion = que["question"];
        option1 = que["options"][0];
        option2 = que["options"][1];
        option3 = que["options"][2];
        option4 = que["options"][3];
        startTimer();
      });
    } else {
      print("Api Error");
    }
  }

  int count = 0;
  // api call
  void increment() {
    if (count <= 8) {
      setState(() {
        print(ques);
        print(answers);
        count++;
        que = questions[count];
        _start = que["timer"];
        aQuestion = que["question"];
        option1 = que["options"][0];
        option2 = que["options"][1];
        option3 = que["options"][2];
        option4 = que["options"][3];
        optionSelected = "";
      });
    }
  }

  void checkAnswers() async {
    Map data = {"questions": ques, "answers": answers};
    var body = json.encode(data);
    final response = await http.post(
        Uri.parse("https://quizcash.herokuapp.com/questions/checkAnswers"),
        headers: {"Content-Type": "application/json"},
        body: body);
    var res = jsonDecode(response.body.toString());
    print(res);
    if (res["message"] == "failed") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
              connector: widget.connector,
              totalQuestions: res["totalQuestions"],
              correctAnswers: res["correctAnswers"],
              wrongAnswers: res["wrongAnswers"]),
        ),
      );
    } else if (res["message"] == "Success! You Passed") {
      Map data = {"address": widget.connector.address, "reward": res["reward"]};
      var body = json.encode(data);
      final response = http.post(
          Uri.parse("https://quizcash.herokuapp.com/claimReward/create"),
          headers: {"Content-Type": "application/json"},
          body: body);
      Map l = {"level": "${widget.level + 1}"};
      var l1 = json.encode(l);
      if (widget.level + 1 <= 3) {
        final result = http.put(
            Uri.parse(
                "https://quizcash.herokuapp.com/players/update/level/${widget.connector.address}"),
            headers: {"Content-Type": "application/json"},
            body: l1);
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultSuccessScreen(
              connector: widget.connector,
              reward: res["reward"],
            ),
          ));
    }
  }

  initState() {
    super.initState();
    setState(() {
      count = 0;
      aQuestion = "Loading";
      option1 = "...";
      option2 = "...";
      option3 = "...";
      option4 = "...";
    });
    getQuestions();
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                  child: Stack(
                children: [
                  Image.asset("assets/images/quiz_image.png"),
                  Positioned(
                    bottom: 10,
                    right: 140,
                    child: Text(
                      "${count + 1}/10",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(
                height: 50,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 370,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                      ),
                      border: Border.all(color: AppColors.greenColor, width: 2),
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
                      children: [
                        SizedBox(
                          height: 42.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Text(
                            "$aQuestion",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  optionSelected = "A";
                                });
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  optionSelected == "A"
                                      ? Image.asset("assets/images/true.png")
                                      : Image.asset("assets/images/false.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "$option1",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  optionSelected = "B";
                                });
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  optionSelected == "B"
                                      ? Image.asset("assets/images/true.png")
                                      : Image.asset("assets/images/false.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "$option2",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  optionSelected = "C";
                                });
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  optionSelected == "C"
                                      ? Image.asset("assets/images/true.png")
                                      : Image.asset("assets/images/false.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "$option3",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  optionSelected = "D";
                                });
                              },
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  optionSelected == "D"
                                      ? Image.asset("assets/images/true.png")
                                      : Image.asset("assets/images/false.png"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "$option4",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 46.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: AppColors.greenColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: TextButton(
                                    child: Text("Submit",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        )),
                                    onPressed: () {
                                      if (count >= 9) {
                                        setState(() {
                                          ques.add(que["id"]);
                                          answers.add(optionSelected);
                                        });
                                        checkAnswers();
                                      } else if (optionSelected.length == 1) {
                                        setState(() {
                                          ques.add(que["id"]);
                                          answers.add(optionSelected);
                                        });
                                        increment();
                                      }
                                    },
                                    style: ButtonStyle(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                  Positioned(
                    left: 150,
                    top: -20,
                    child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.greenColor,
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "${_start}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
