import 'package:flutter/material.dart';
import 'package:shoexsmass/shared/global.dart';

class AddressItem extends StatelessWidget {
  String address;
  String store;

  AddressItem({required this.address, required this.store});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      padding: EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Address Details",
            style: poppinsText.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: black
            ),
          ),
          SizedBox(height: 12,),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/iclocfrom.png")
                          )
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/icline.png")
                      )
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                      ],
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Container(
                        height: 20,
                        width: 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/iclocto.png")
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: poppinsText.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                            color: grey
                          ),
                        ),
                        Text(
                          store,
                          style: poppinsText.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                            color: black
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Address",
                          style: poppinsText.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                            color: grey
                          ),
                        ),
                        Text(
                          address,
                          style: poppinsText.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                            color: black
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}