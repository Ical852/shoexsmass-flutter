import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/services/userservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/custominput.dart';
import 'package:shoexsmass/widgets/type2header.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController phoneController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");

    void showAlert(type, text) {
      return showGLobalAlert(type, text, context);
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Type2Header(
              title: "Sign Up",
              subTitle: "sign up and start to buy shoes",
              onPress: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/illustrations/ilsignup.png"))),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  CustomInput(
                    title: "Full Name",
                    hint: "Masukkan Full Name",
                    controller: fullnameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    title: "Email Address",
                    hint: "Masukkan Email Address",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    title: "Phone Number",
                    hint: "Masukkan Phone Number",
                    controller: phoneController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomInput(
                    title: "Password",
                    hint: "Masukkan Password",
                    password: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserSigningUpSuccess) {
                        showAlert('success', 'Sign Up Success');
                        Timer(Duration(seconds: 1), () {
                          Navigator.pushNamed(context, "/sign-up-success");
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is UserSigningUp) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return CustomButton(title: "Sign Up",onPress: () async {
                        if (emailController.text == "" || passwordController.text == '' || phoneController.text == '' || passwordController.text == '') {
                          return showAlert('danger', 'Isi form dengan benar');
                        }

                        var response = await UserService().emailCheck(email: emailController.text);
                        if (!response) {
                          return showAlert('danger', 'Email telah terdaftar');
                        }

                        context.read<UserCubit>().register(
                          fullName: fullnameController.text, 
                          email: emailController.text, 
                          phoneNumber: int.parse(phoneController.text),
                          password: passwordController.text
                        );
                      });
                    },
                  ),
                  SizedBox(
                    height: 75,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
