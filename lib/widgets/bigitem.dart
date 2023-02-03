import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/tagcat.dart';

class BigItem extends StatelessWidget {
  String img;
  String cat;
  String name;
  int price;
  Function() onPress;

  BigItem({required this.img, required this.cat, required this.name, required this.price, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 24,
          top: 16,
          bottom: 20
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10
        ),
        height: 205,
        width: MediaQuery.of(context).size.width - 48,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 3,
              offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 92,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(img),
                )
              ),
            ),
            SizedBox(height: 12,),
            TagCat(title: cat,),
            SizedBox(height: 6,),
            Text(
              name,
              style: poppinsText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 6,),
            Text(
              "IDR. " + formatter(price),
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: orange1
              ),
            ),
          ],
        ),
      ),
    );
  }
}