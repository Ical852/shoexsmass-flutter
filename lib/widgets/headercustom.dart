import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/backbutton.dart';

class HeaderCustom extends StatelessWidget {
  String title;
  Function() onPress;

  HeaderCustom({required this.title, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonCustom(onPress: onPress, secondary: true,),
                Text(
                  title,
                  style: poppinsText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                    color: black
                  ),
                ),
                Container(width: 26,)
              ],
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