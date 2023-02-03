import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class InfoItem extends StatelessWidget {
  String title;
  String desc;
  Function() onPress;

  InfoItem({required this.title, required this.desc, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14
          ),
          height: 100,
          decoration: BoxDecoration(
            color: orange5,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: orange1
            )
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/icinfo.png")
                  )
                ),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: poppinsText.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                        color: black
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      desc,
                      style: poppinsText.copyWith(
                        fontSize: 10,
                        fontWeight: light,
                        color: black
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onPress,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(
                top: 12,
                right: 12
              ),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/iccross.png")
                )
              ),
            ),
          ),
        )
      ]
    );
  }
}