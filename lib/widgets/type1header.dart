import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class Type1Header extends StatelessWidget {
  String title;
  String subTitle;

  Type1Header({required this.title, required this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 32
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: poppinsText.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                      color: black
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    subTitle,
                    style: poppinsText.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                      color: grey
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: line,
          )
        ],
      ),
    );
  }
}