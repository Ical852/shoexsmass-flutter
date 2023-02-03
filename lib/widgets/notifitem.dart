import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class NotifItem extends StatelessWidget {
  String title;
  String desc;
  String date;

  NotifItem({required this.title, required this.desc, required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 20
      ),
      padding: EdgeInsets.all(24),
      height: 120,
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
          Expanded(
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
                    fontSize: 10,
                    fontWeight: medium,
                    color: grey
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 18,),
          Text(
            date,
            style: poppinsText.copyWith(
              fontSize: 10,
              fontWeight: light,
              color: grey
            ),
          )
        ],
      ),
    );
  }
}