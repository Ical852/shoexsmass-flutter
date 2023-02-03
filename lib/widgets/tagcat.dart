import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class TagCat extends StatelessWidget {
  String title;

  TagCat({required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 9
      ),
      decoration: BoxDecoration(
        color: orange1,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        title,
        style: poppinsText.copyWith(
          fontSize: 10,
          fontWeight: regular,
          color: white
        ),
      ),
    );
  }
}