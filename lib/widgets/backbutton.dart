import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class BackButtonCustom extends StatelessWidget {
  Function() onPress;
  bool secondary;

  BackButtonCustom({required this.onPress, this.secondary = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 26,
        width: 26,
        decoration: BoxDecoration(
          color: secondary ? white : orange4,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ]
        ),
        child: Center(
          child: Container(
            width: 7,
            height: 12,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(secondary ? "assets/icons/icbackblack.png" : "assets/icons/icbackwhite.png")
              )
            ),
          ),
        ),
      ),
    );
  }
}