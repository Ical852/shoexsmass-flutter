import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';

class OnboardingFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/illustrations/ilhello.png")
                    )
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  margin: EdgeInsets.only(
                    left: 24,
                    right: 24
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Shoex S Mass",
                        style: poppinsText.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                          color: black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "Selamat datang di Shoex s Mass, tempat dimana kamu dapat mencari dan membeli sepatu kesukaanmu. Lanjut untuk mendapat info lebih, skip untuk langsung gas beli sepatu!",
                        style: poppinsText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                          color: grey
                        ),
                      ),
                      SizedBox(height: 32,),
                      CustomButton(
                        title: "Get Started",
                        onPress: (){
                          Navigator.pushNamed(context, "/ob2");
                        },
                      ),
                      SizedBox(height: 32,)
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