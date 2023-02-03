import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/custominput.dart';
import 'package:shoexsmass/widgets/type2header.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController addressController = TextEditingController(text: "");

  var loading = false;

  @override
  void initState() {
    super.initState();
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserFetchingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
      fullnameController.text = state.user.fullName;
      emailController.text = state.user.email;
      phoneController.text = state.user.phoneNumber.toString();
      addressController.text = state.user.address;
    }
    if (state is UserUpdatingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
      fullnameController.text = state.user.fullName;
      emailController.text = state.user.email;
      phoneController.text = state.user.phoneNumber.toString();
      addressController.text = state.user.address;
    }
  }

  void showAlert(type, text) {
    return showGLobalAlert(type, text, context);
  }

  void onUpdate() async {
    this.setState(() {
      loading = true;
    });
    var state = BlocProvider.of<UserCubit>(context).state;
    if (state is UserFetchingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
      context.read<UserCubit>().update(
        id: state.user.id, 
        fullName: fullnameController.text, 
        email: emailController.text, 
        phoneNumber: int.parse(phoneController.text), 
        address: addressController.text, 
        password: 12345678.toString(), 
        balance: state.user.balance
      );
    }
    if (state is UserUpdatingSuccess) {
      context.read<UserCubit>().fetch(userId: state.user.id);
      context.read<UserCubit>().update(
        id: state.user.id, 
        fullName: fullnameController.text, 
        email: emailController.text, 
        phoneNumber: int.parse(phoneController.text), 
        address: addressController.text, 
        password: 12345678.toString(), 
        balance: state.user.balance
      );
    }
    this.setState(() {
      loading = false;
    });
    showAlert('success', "Update Profile Success");
    Timer(Duration(seconds: 1), () {
      Navigator.pushNamed(context, "/main");
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            Type2Header(title: "Edit Profile", subTitle: "edit your profile data here", onPress: (){
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
                  image: AssetImage("assets/illustrations/ileditprofile.png")
                )
              ),
            ),
            SizedBox(height: 32,),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 32
              ),
              child: Column(
                children: [
                  CustomInput(
                    title: "Full Name", hint: "Masukkan Full Name", controller: fullnameController,
                  ),
                  SizedBox(height: 20,),
                  CustomInput(
                    title: "Email Address", hint: "Masukkan Email Address", controller: emailController,
                  ),
                  SizedBox(height: 20,),
                  CustomInput(
                    title: "Phone Number", hint: "Masukkan Phone Number", controller: phoneController,
                  ),
                  SizedBox(height: 20,),
                  CustomInput(
                    title: "Address", hint: "Masukkan Address", controller: addressController,
                  ),
                  SizedBox(height: 24,),
                  loading ?
                  Center(
                    child: CircularProgressIndicator(),
                  ) 
                  : CustomButton(title: "Save", onPress: (){
                    onUpdate();
                  }),
                  SizedBox(height: 16,),
                  CustomButton(title: "Change Password", onPress: () {
                    Navigator.pushNamed(context, "/change-pw");
                  }, type: "secondary",),
                ],
              ),
            ),
            SizedBox(height: 32,)
          ],
        ),
      ),
    );
  }
}