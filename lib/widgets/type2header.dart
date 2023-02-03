import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class Type2Header extends StatelessWidget {
  String title;
  String subTitle;
  Function() onPress;

  Type2Header({required this.title, required this.subTitle, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(32),
          child: Row(
            children: [
              GestureDetector(
                onTap: onPress,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/icbacksec.png")
                    )
                  ),
                ),
              ),
              SizedBox(width: 32,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: line,
        )
      ],
    );
  }
}