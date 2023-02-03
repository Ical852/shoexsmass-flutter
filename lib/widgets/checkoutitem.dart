import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class CheckoutItem extends StatelessWidget {
  String img;
  String name;
  int price;
  int total;

  CheckoutItem({required this.img, required this.name, required this.price, required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        bottom: 12
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20
      ),
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img)
              )
            ),
          ),
          SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                    color: black
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "IDR. " + formatter(price),
                  style: poppinsText.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    color: orange1
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 12
            ),
            child: Text(
              total.toString() + " items",
              style: poppinsText.copyWith(
                fontSize: 12,
                fontWeight: regular,
                color: grey
              ),
            ),
          )
        ],
      ),
    );
  }
}