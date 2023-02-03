import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/ob1");
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [orange2, orange1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 114,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/illustrations/illogo.png")
                  )
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "Shoex S Mass",
                style: poppinsText.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                  color:white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}