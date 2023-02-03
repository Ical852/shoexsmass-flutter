import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';

class BonusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              color: orange1,
              width: double.infinity,
              height: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 406,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 24
                ),
                height: 555,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/illustrations/ilbonus.png")
                        )
                      ),
                    ),
                    Text(
                      "You got SsmPay !",
                      style: poppinsText.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                        color: black
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "Bonus untuk user baru",
                      style: poppinsText.copyWith(
                        fontSize: 16,
                        fontWeight: regular,
                        color: grey
                      ),
                    ),
                    SizedBox(height: 32,),
                    Text(
                      "IDR. " + formatter(50000),
                      style: poppinsText.copyWith(
                        fontSize: 32,
                        fontWeight: semiBold,
                        color: black
                      ),
                    ),
                    SizedBox(height: 32,),
                    CustomButton(title: "Continue", onPress: (){
                      Navigator.pushNamed(context, "/main");
                    })
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 100
              ),
              width: double.infinity,
              child: Text(
                "New User Bonus !",
                style: poppinsText.copyWith(
                  fontSize: 28,
                  fontWeight: semiBold,
                  color: white
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}