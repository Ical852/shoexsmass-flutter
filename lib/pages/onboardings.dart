import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';

class OnboardingSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget topContent() {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 100
              ),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/illustrations/ilok.png")
                )
              ),
            ),
            SizedBox(height: 24,),
            Text(
              "Up to Date",
              style: poppinsText.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 8,),
            Container(
              width: 320,
              child: Text(
                "Lebih mudah untuk mengetahui sepatu-septu terbaru saat ini",
                style: poppinsText.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                  color: grey
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }

    Widget bottomContent() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 148,
          margin: EdgeInsets.only(
            left: 24,
            right: 24
          ),
          child: Column(
            children: [
              CustomButton(title: "Continue", onPress: (){
                Navigator.pushNamed(context, "/ob3");
              }),
              SizedBox(height: 16,),
              CustomButton(title: "Skip", onPress: () {}, type: "secondary",),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              topContent(),
              bottomContent()
            ],
          ),
        ),
      ),
    );
  }
}