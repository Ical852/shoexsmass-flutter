import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/minibutton.dart';

class TopUpSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/illustrations/iltopup.png")
                  )
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Top Up Success!",
                style: poppinsText.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 6
                ),
                width: 234,
                child: Text(
                  "Now you can buy any shoes with your Ssm Pay!!!",
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: light,
                    color: grey
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30,),
              MiniButton(title: "Home", onPress: (){
                Navigator.pushNamed(context, "/main");
              })
            ],
          ),
        ),
      ),
    );
  }
}