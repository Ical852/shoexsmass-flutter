import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/product_cubit.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/pages/detail.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/infoitem.dart';
import 'package:shoexsmass/widgets/mainitem.dart';
import 'package:shoexsmass/widgets/minibutton.dart';
import 'package:shoexsmass/widgets/ssmpay.dart';
import 'package:shoexsmass/widgets/topupinfo.dart';

class WishPage extends StatefulWidget {
  @override
  State<WishPage> createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {
  var empty = true;
  List<ProductModel> fav = [];

  @override
  void initState() {
    super.initState();
    var favState = BlocProvider.of<ProductCubit>(context).state;
    if (favState.length > 0) {
      setState(() {
        fav = favState;
        empty = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget topBg() {
      return Container(
        height: 112,
        decoration: BoxDecoration(
          color: orange1
        ),
      );
    }

    Widget topContent() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: Offset(0, 2))
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: 12
                          ),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/icsearch.png")
                            )
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Search your wishlist here...",
                              hintStyle: poppinsText.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: grey
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                    left: 16
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/icnotiforange.png")
                      )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserFetchingSuccess) {
                  return Container(
                    child: SSMPay(
                      balance: state.user.balance,
                      onPress: () {
                        Navigator.pushNamed(context, "/top-up");
                      },
                    ));
                }
                if (state is UserFetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container();
              },
            )
          ],
        ),
      );
    }

    Widget infoArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          children: [
            InfoItem(
              title: "Info",
              desc: "There are some promotion for topping up Smm pay. Only on this day, top up IDR. 500.000 Smm Pay will give you IDR. 250.000 Smm Pay Bonus.",
              onPress: (){},
            ),
            SizedBox(height: 16,),
            TopUpInfo()
          ],
        ),
      );
    }

    Widget emptyArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 32
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 250,
              height: 166,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/illustrations/ilemptywish.png")
                )
              ),
            ),
            SizedBox(height: 24,),
            Text(
              "No Wishlist Yet",
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: regular,
                color: grey
              ),
            ),
            SizedBox(height: 16,),
            MiniButton(
              title: "Find Shoes",
              onPress: (){
                Navigator.pushNamed(context, "/main");
              },
            )
          ],
        ),
      );
    }

    Widget itemsArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 24,
          right: 24
        ),
        child: Column(
          children: fav.map((data) => 
            MainItem(
              img: data.productImage[0].image,
              name: data.name,
              desc: data.desc,
              price: data.price,
              cat: data.category.name,
              onPress: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => DetailPage(data)
                  )
                );
              },
            ),
          ).toList(),
        ),
      );
    }

    Widget renderMainContent() {
      return empty ? emptyArea() : itemsArea();
    }

    Widget content() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topContent(),
            infoArea(),
            Container(
              height: 1,
              color: line,
              margin: EdgeInsets.only(
                top: 32
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24
              ),
              child: Text(
                "All of Your Wishlist",
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            renderMainContent(),
            SizedBox(height: 120,)
          ],
        ),
      );
    }

    return Container(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            topBg(),
            content()
          ],
        ),
      ),
    );
  }
}