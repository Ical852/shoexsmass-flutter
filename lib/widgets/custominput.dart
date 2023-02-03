import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class CustomInput extends StatelessWidget {
  String title;
  String hint;
  bool password;
  TextEditingController controller;

  CustomInput({required this.title, required this.hint, this.password = false, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: regular,
              color: black
            ),
          ),
          SizedBox(height: 6,),
          TextFormField(
            controller: controller,
            obscureText: password,
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: regular,
              color: black
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: poppinsText.copyWith(
                fontSize: 16,
                fontWeight: regular,
                color: orange3
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: orange3
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              contentPadding: EdgeInsets.only(
                top: 13,
                bottom: 13,
                left: 21,
                right: 21
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: orange1
                ),
                borderRadius: BorderRadius.circular(8)
              ),
            ),
          )
        ],
      ),
    );
  }
}