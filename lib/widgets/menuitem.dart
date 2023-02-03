import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class MenuItem extends StatelessWidget {
  String title;
  String icon;
  bool active;
  Function() onPress;

  MenuItem({required this.title ,required this.icon, this.active = false, required this.onPress});
  @override
  Widget build(BuildContext context) {
    String iconMenu() {
      if (icon == 'home') {
        return active ? "assets/icons/ichomeactive.png" : "assets/icons/ichome.png";
      } else if (icon == 'explore') {
        return active ? "assets/icons/icexploreactive.png" : "assets/icons/icexplore.png";
      } else if (icon == 'wish') {
        return active ? "assets/icons/icwishactive.png" : "assets/icons/icwish.png";
      } else {
        return active ? "assets/icons/icprofileactive.png" : "assets/icons/icprofile.png";
      }
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iconMenu())
                )
              ),
            ),
            SizedBox(height: 2,),
            Text(
              title,
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: active ? orange1 : orange5
              ),
            )
          ],
        ),
      ),
    );
  }
}