import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/services/userservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/custominput.dart';
import 'package:shoexsmass/widgets/type1header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");

    void showAlert(type, text) {
      return showGLobalAlert(type, text, context);
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Type1Header(
              title: "Sign In",
              subTitle: "Sign in to continue to apps",
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/illustrations/ilsignin.png"))),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInput(
                    title: "Email Address",
                    hint: "Masukkan Email Address",
                    controller: emailController,
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
                  GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, "/reset")},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      child: Text(
                        "Forgot Password ?",
                        style: poppinsText.copyWith(
                            fontSize: 14, fontWeight: semiBold, color: orange1),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserSigningInSuccess) {
                        showAlert('success', 'Sign In Success');
                        Timer(Duration(seconds: 1), () {
                          Navigator.pushNamed(context, "/main");
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is UserSigningIn) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return CustomButton(title: "Sign In", onPress: () async {
                        if (emailController.text == "" || passwordController.text == '') {
                          return showAlert('danger', 'Isi form dengan benar');
                        }

                        var response = await UserService().login(
                          email: emailController.text,
                          password: passwordController.text
                        );
                        if (response.id == null) {
                          return showAlert('danger', 'User tidak ditemukan');
                        }

                        context.read<UserCubit>().login(
                          email: emailController.text,
                          password: passwordController.text
                        );
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    title: "Sign Up",
                    onPress: () {
                      Navigator.pushNamed(context, "/sign-up");
                    },
                    type: "secondary",
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
