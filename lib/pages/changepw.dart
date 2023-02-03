import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/custominput.dart';
import 'package:shoexsmass/widgets/type2header.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController currpwController = TextEditingController(text: "");
    TextEditingController newpwController = TextEditingController(text: "");
    TextEditingController connewpwController = TextEditingController(text: "");

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Type2Header(title: "Change Password", subTitle: "update your password here", onPress: (){
              Navigator.pop(context);
            }),
            Container(
              margin: EdgeInsets.only(
                top: 32
              ),
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/illustrations/ilchangepw.png")
                )
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32
              ),
              child: Column(
                children: [
                  CustomInput(title: "Current Password", hint: "Masukkan Current Password", controller: currpwController,),
                  SizedBox(height: 20,),
                  CustomInput(title: "New Password", hint: "Masukkan New Password", controller: newpwController,),
                  SizedBox(height: 20,),
                  CustomInput(title: "Confirm New Password", hint: "Masukkan Confirm New Password", controller: connewpwController,),
                  SizedBox(height: 20,),
                  CustomButton(title: "Save", onPress: (){})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}