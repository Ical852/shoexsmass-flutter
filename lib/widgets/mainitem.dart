import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/tagcat.dart';

class MainItem extends StatelessWidget {
  String img;
  String cat;
  String name;
  String desc;
  int price;
  Function() onPress;
  String type;
  int totalItem;
  bool trx;
  Function()? onCancel;

  MainItem({required this.img, required this.cat, required this.desc, required this.name, required this.onPress, required this.price, this.type = 'primary', this.totalItem = 0, this.trx = false,
    this.onCancel
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20
        ),
        padding: EdgeInsets.all(16),
        height: 150,
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
              width: 118,
              height: 118,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover
                )
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onCancel,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TagCat(title: cat),
                        type == 'cart' && !trx ? Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: red,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/iccrosswhite.png")
                                )
                              ),
                            ),
                          ),
                        ): Container()
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    name,
                    style: poppinsText.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: semiBold,
                      color: black
                    ),
                    maxLines: 1,
                  ),
                  type == 'cart' ? SizedBox() : SizedBox(height: 8,),
                  Expanded(
                    child: type == 'cart' ? Row(
                      children: [
                        Text(
                          totalItem.toString() + " items X  ",
                          style: poppinsText.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: black
                          ),
                        ),
                        Text(
                          "IDR. " + formatter(price),
                          style: poppinsText.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                            color: orange1
                          ),
                        )
                      ],
                    ) : Text(
                      desc,
                      style: poppinsText.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 10,
                        fontWeight: semiBold,
                        color: grey
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: type == 'cart' ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                    children: [
                      type == 'cart' ? Text(
                        "Total : ",
                        style: poppinsText.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          color: black
                        ),
                      ) : Text(
                        "IDR. " + formatter(price),
                        style: poppinsText.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          color: orange1
                        ),
                      ),
                      type == 'cart' ? Text(
                        "IDR. " + formatter(totalItem * price),
                        style: poppinsText.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                          color: orange1
                        ),
                      ) : GestureDetector(
                        onTap: onPress,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4
                          ),
                          decoration: BoxDecoration(
                            color: orange1,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            "Buy",
                            style: poppinsText.copyWith(
                              fontSize: 10,
                              fontWeight: regular,
                              color: white
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}