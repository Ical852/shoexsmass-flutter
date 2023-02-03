import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/custominput.dart';
import 'package:shoexsmass/widgets/type2header.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Type2Header(title: "Reset Password", subTitle: "send your email address to us", onPress: (){
              Navigator.pop(context);
            }),
            SizedBox(height: 32,),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/illustrations/ilreset.png")
                )
              ),
            ),
            SizedBox(height: 32,),
            Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24
              ),
              child: Column(
                children: [
                  CustomInput(title: "Email Address", hint: "Masukkan Email Address", controller: emailController,),
                  SizedBox(height: 24,),
                  CustomButton(title: "Send Link", onPress: (){}),
                  SizedBox(height: 16,),
                  CustomButton(title: "Sign In", onPress: () {
                    Navigator.pushNamed(context, "/sign-in");
                  }, type: "secondary",),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}