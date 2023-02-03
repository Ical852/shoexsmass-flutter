//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

String baseUrl = "http://192.168.100.6:8000/api";

String formatter(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted;
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 1),
    content: Text(
      text,
      style: poppinsText.copyWith(fontSize: 14, color: white, fontWeight: bold),
      textAlign: TextAlign.center,
    ),
    backgroundColor: type == 'danger' ? red : Color(0xff27BD48),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
  ));
}

TextStyle poppinsText = GoogleFonts.poppins();

Color orange1 = Color(0xffF86A2F);
Color orange2 = Color(0xffF77F4C);
Color orange3 = Color(0xffECE1D7);
Color orange4 = Color(0xffFAA06D);
Color orange5 = Color(0xffFDEBD1);
Color orange6 = Color(0xffFFCD9F);
Color black = Color(0xff15171F);
Color white = Color(0xffFFFFFF);
Color grey = Color(0xff9698A9);
Color grey2 = Color(0xffF6F6F6);
Color grey3 = Color(0xffF6F7FB);
Color cream = Color(0xffE9E6D5);
Color red = Color(0xffF82F2F);
Color line = Color(0xffEEEEEE);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBold = FontWeight.w900;
