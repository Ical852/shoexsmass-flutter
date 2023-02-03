import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class TitleDesc extends StatelessWidget {
  String title;
  String subTitle;

  TitleDesc({required this.title, required this.subTitle});
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
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 2,),
          Text(
            subTitle,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: regular,
              color: grey
            ),
          )
        ],
      ),
    );
  }
}