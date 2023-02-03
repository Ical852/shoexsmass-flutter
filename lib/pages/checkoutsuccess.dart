import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/minibutton.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/illustrations/ilsuccesscheckout.png")
                  )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                "Checkout Success!",
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
                width: 200,
                child: Text(
                  "Now you have to wait for the shoes that you just ordered",
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