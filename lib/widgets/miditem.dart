import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/tagcat.dart';

class MidItem extends StatelessWidget {
  String img;
  String cat;
  String name;
  int price;
  Function() onPress;

  MidItem({required this.img, required this.cat, required this.name, required this.price, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          right: 20,
          top: 16,
          bottom: 20
        ),
        padding: EdgeInsets.all(20),
        height: 278,
        width: 215,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagCat(title: cat),
            SizedBox(height: 20,),
            Container(
              width: 215,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              name,
              style: poppinsText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: black
              ),
              maxLines: 1,
            ),
            SizedBox(height: 6,),
            Text(
              "IDR. " + formatter(price),
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: orange1
              ),
            ) 
          ],
        ),
      ),
    );
  }
}