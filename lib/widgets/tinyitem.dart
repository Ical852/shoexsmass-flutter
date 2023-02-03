import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/tagcat.dart';

class TinyItem extends StatelessWidget {
  String img;
  String cat;
  String name;
  int price;

  TinyItem({required this.img, required this.cat, required this.name, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 107,
      width: (MediaQuery.of(context).size.width / 2) - 24 - 8,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img)
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: TagCat(title: cat),
                ),
              )
            ],
          ),
          SizedBox(height: 8,),
          Text(
            name,
            style: poppinsText.copyWith(
              fontSize: 12,
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 4,),
          Text(
            "IDR. " + formatter(price),
            style: poppinsText.copyWith(
              fontSize: 10,
              fontWeight: semiBold,
              color: orange1
            ),
          )
        ],
      ),
    );
  }
}