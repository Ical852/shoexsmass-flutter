import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class ProfileItem extends StatelessWidget {
  String title;
  String desc;
  String img;
  Function() onPress;

  ProfileItem({required this.title, required this.desc, required this.img, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 76,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Color(0xffF8F9FC),
                borderRadius: BorderRadius.circular(14)
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img)
                  )
                ),
              ),
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 16
                ),
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
                    SizedBox(height: 4,),
                    Text(
                      desc,
                      style: poppinsText.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                        color: grey
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 12,
              height: 16,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/icright.png")
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}