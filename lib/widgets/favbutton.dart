import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class FavButton extends StatelessWidget {
  bool active;
  Function() onPress;

  FavButton({required this.onPress, this.active = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: active ? orange1 : grey2,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Container(
            width: 22,
            height: 20,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(active ? "assets/icons/icfavactive.png" : "assets/icons/icfav.png")
              )
            ),
          ),
        ),
      ),
    );
  }
}