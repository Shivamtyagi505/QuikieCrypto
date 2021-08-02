import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quikiecrypto/screen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void screenTransition() async {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CryPtoCurrencies())));
  }

  @override
  void initState() {
    super.initState();
      screenTransition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.red],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
      child: Center(
        child: Container(
          height: 200,
          child: Column(
            children: [
              Image.asset(
                'assets/icon/icon3.png',
                height: 120,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'QuickieApps Crypto',
                style: TextStyle(color: Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
