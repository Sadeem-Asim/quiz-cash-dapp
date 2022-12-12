import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_cash/pages/alert_dialog_1.dart';
import 'package:quiz_cash/pages/approve_token.dart';
import 'package:quiz_cash/pages/language_selection.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "package:quiz_cash/pages/data/ethereum_connector.dart";
import "package:quiz_cash/pages/data/repo/wallet_connector.dart";
import 'package:quiz_cash/pages/quiz_home_screen.dart';
import 'package:quiz_cash/pages/quiz_page.dart';
import "package:quiz_cash/pages/wallet.dart";
import 'package:quiz_cash/pages/approve_token.dart';

enum ConnectionState {
  disconnected,
  connecting,
  connected,
  connectionFailed,
  connectionCancelled,
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool changeValue = false;
  var level = 2;
  WalletConnector connector = EthereumConnector();
  ConnectionState _state = ConnectionState.disconnected;

  void initState() {
    connector.registerListeners((session) => print('Connected: $session'),
        (response) => print('Session updated: $response'), () {
      setState(
        () => _state = ConnectionState.disconnected,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/Rectangle.png",
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/welcomePic.png",
                ),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    // func();
                  },
                  child: Container(
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25).r,
                      border: Border.all(color: Colors.grey, width: 1.5.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/fox.png"),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextButton(
                          onPressed:
                              _transactionStateToAction(context, state: _state),
                          child: Text(
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.black,
                            ),
                            _transactionStateToString(state: _state),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _transactionStateToString({required ConnectionState state}) {
    switch (state) {
      case ConnectionState.disconnected:
        return 'Connect!';
      case ConnectionState.connecting:
        return 'Connecting';
      case ConnectionState.connected:
        return 'Session connected';
      case ConnectionState.connectionFailed:
        return 'Connection failed';
      case ConnectionState.connectionCancelled:
        return 'Connection cancelled';
    }
  }

  VoidCallback? _transactionStateToAction(BuildContext context,
      {required ConnectionState state}) {
    print('State: ${_transactionStateToString(state: state)}');
    switch (state) {
      case ConnectionState.connecting:
        return null;
      case ConnectionState.connected:
        return () => _openWalletPage();

      case ConnectionState.disconnected:
      case ConnectionState.connectionCancelled:
      case ConnectionState.connectionFailed:
        return () async {
          setState(() => _state = ConnectionState.connecting);
          try {
            final session = await connector.connect(context);
            if (session != null) {
              setState(() => _state = ConnectionState.connected);
              Future.delayed(Duration.zero, () => _openWalletPage());
            } else {
              setState(() => _state = ConnectionState.connectionCancelled);
            }
          } catch (e) {
            setState(() => _state = ConnectionState.connectionFailed);
          }
        };
    }
  }

  void _openWalletPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuizHomeScreen(connector: connector),
      ),
    );
  }

  void func() {}
}
