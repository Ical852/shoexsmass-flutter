import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class PaySumItem extends StatelessWidget {
  String title;
  String value;

  PaySumItem({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: regular,
              color: grey
            ),
          ),
          Text(
            value,
            style: poppinsText.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
              color: black
            ),
          )
        ],
      ),
    );
  }
}