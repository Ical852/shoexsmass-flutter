import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';

class SignUpSuccess extends StatelessWidget {
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
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/illustrations/ilsuccess.png")
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
                        "Sign up success!, you can start the apps",
                        style: poppinsText.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                          color: black,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "Sign Up Berhasil, kini kamu dapat memulai mencari dan membeli sepatu yang kamu inginkan. Top up sekarang untuk mendapatkan bonus!",
                        style: poppinsText.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                          color: grey
                        ),
                      ),
                      SizedBox(height: 32,),
                      CustomButton(
                        title: "Continue",
                        onPress: (){
                          Navigator.pushNamed(context, "/bonus");
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