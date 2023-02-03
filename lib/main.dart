//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/cart_cubit.dart';
import 'package:shoexsmass/cubit/product_cubit.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/pages/bonus.dart';
import 'package:shoexsmass/pages/cart.dart';
import 'package:shoexsmass/pages/changepw.dart';
import 'package:shoexsmass/pages/checkout.dart';
import 'package:shoexsmass/pages/checkoutsuccess.dart';
import 'package:shoexsmass/pages/detail.dart';
import 'package:shoexsmass/pages/editprofile.dart';
import 'package:shoexsmass/pages/main.dart';
import 'package:shoexsmass/pages/notif.dart';
import 'package:shoexsmass/pages/onboardingf.dart';
import 'package:shoexsmass/pages/onboardingl.dart';
import 'package:shoexsmass/pages/onboardings.dart';
import 'package:shoexsmass/pages/onboardingt.dart';
import 'package:shoexsmass/pages/resetpassword.dart';
import 'package:shoexsmass/pages/signin.dart';
import 'package:shoexsmass/pages/signup.dart';
import 'package:shoexsmass/pages/singupsuccess.dart';
import 'package:shoexsmass/pages/splash.dart';
import 'package:shoexsmass/pages/topup.dart';
import 'package:shoexsmass/pages/topupsucces.dart';
import 'package:shoexsmass/pages/topupsummary.dart';
import 'package:shoexsmass/pages/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CartCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => SplashPage(),
          "/ob1" :(context) => OnboardingFirst(),
          "/ob2" : (context) => OnboardingSecond(),
          "/ob3": (context) => OnboardingThird(),
          "/ob4": (context) => OnboardingLast(),
          "/sign-in": (context) => SignInPage(),
          "/sign-up": (context) => SignUpPage(),
          "/reset": (context) => ResetPasswordPage(),
          "/sign-up-success": (context) => SignUpSuccess(),
          "/bonus": (context) => BonusPage(),
          "/main": (context) => MainPage(),
          "/top-up": (context) => TopUpPage(),
          "/top-up-success": (context) => TopUpSuccess(),
          "/cart": (context) => CartPage(),
          "/checkout-success": (context) => CheckoutSuccessPage(),
          "/notif": (context) => NotifPage(),
          "/trx": (context) => TransactionPage(),
          "/edit-profile": (context) => EditProfilePage(),
          "/change-pw": (context) => ChangePasswordPage(),
        },
      ),
    );
  }
}