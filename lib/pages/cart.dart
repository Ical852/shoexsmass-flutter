import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoexsmass/cubit/cart_cubit.dart';
import 'package:shoexsmass/cubit/product_cubit.dart';
import 'package:shoexsmass/cubit/user_cubit.dart';
import 'package:shoexsmass/models/cartmodel.dart';
import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/pages/checkout.dart';
import 'package:shoexsmass/pages/detail.dart';
import 'package:shoexsmass/services/productservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/bigitem.dart';
import 'package:shoexsmass/widgets/custombutton.dart';
import 'package:shoexsmass/widgets/headercustom.dart';
import 'package:shoexsmass/widgets/mainitem.dart';
import 'package:shoexsmass/widgets/minibutton.dart';
import 'package:shoexsmass/widgets/titledesc.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var empty = true;
  var emptyWish = true;
  var loading1 = false;
  var total = 0;
  List<ProductModel> fav = [];
  List<ProductModel> data1 = [];
  List<CartModel> carts = [];

  void getBestSeller() async {
    this.setState(() {
      loading1 = true;
    });
    List<ProductModel> response =
        await ProductService().getByCategoryId(catId: 1);
    this.setState(() {
      data1 = response;
    });
    this.setState(() {
      loading1 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getBestSeller();
    var state = BlocProvider.of<CartCubit>(context).state;
    if (state.length > 0) {
      var curTotal = 0;
      setState(() {
        empty = false;
        carts = state;
      });
      state.forEach((element) {
        curTotal += element.product.price * element.qty;
      });
      this.setState(() {
        total = curTotal;
      });
    }

    var favState = BlocProvider.of<ProductCubit>(context).state;
    if (favState.length > 0) {
      setState(() {
        fav = favState;
        emptyWish = false;
      });
      print(state);
    }
  }

  @override
  Widget build(BuildContext context) {

    void showAlert(type, text) {
      return showGLobalAlert(type, text, context);
    }

    Widget cartExist() {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderCustom(
                    title: "Your Cart",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24, left: 24, bottom: 16),
                    child: Text(
                      "All of your carts",
                      style: poppinsText.copyWith(
                          fontSize: 18, fontWeight: semiBold, color: black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: carts
                          .map(
                            (data) => MainItem(
                              img: data.product.productImage[0].image,
                              name: data.product.name,
                              desc: data.product.desc,
                              price: data.product.price,
                              cat: data.product.category.name,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(data.product)));
                              },
                              onCancel: () {
                                context.read<CartCubit>().removeCart(data);
                                var state =
                                    BlocProvider.of<CartCubit>(context).state;
                                if (state.length > 0) {
                                  var curTotal = 0;
                                  setState(() {
                                    empty = false;
                                    carts = state;
                                  });
                                  state.forEach((element) {
                                    curTotal +=
                                        element.product.price * element.qty;
                                  });
                                  this.setState(() {
                                    total = curTotal;
                                  });
                                }
                                if (state.length == 0) {
                                  this.setState(() {
                                    empty = true;
                                  });
                                }
                              },
                              type: "cart",
                              totalItem: data.qty,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.9),
                    blurRadius: 9,
                    offset: Offset(0, 9))
              ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ",
                        style: poppinsText.copyWith(
                            fontSize: 16, fontWeight: regular, color: black),
                      ),
                      Text(
                        "IDR. " + formatter(total),
                        style: poppinsText.copyWith(
                            fontSize: 18, fontWeight: semiBold, color: orange1),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserFetching) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is UserFetchingSuccess) {
                        return CustomButton(
                          title: "Checkout",
                          onPress: () {
                            if (state.user.address == 'not-setted') {
                              showAlert('danger', 'Anda belum mengisi alamat rumah anda');
                              return Timer(Duration(seconds: 1), () {
                                  Navigator.pushNamed(context, "/edit-profile");
                              });
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckoutPage(carts)));
                          });
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget bestSellerProm() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 24,
                ),
                child: TitleDesc(
                  title: "Best Seller Shoes",
                  subTitle: "Get best seller shoes right now !",
                )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: loading1
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 205,
                      margin: EdgeInsets.only(top: 16, bottom: 20),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Row(
                          children: data1
                              .map((data) => BigItem(
                                    img: data.productImage[0].image,
                                    cat: data.category.name,
                                    name: data.name,
                                    price: data.price,
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPage(data)));
                                    },
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      );
    }

    Widget topEmptyCart() {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Row(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/illustrations/ilemptycart.png"))),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oops, there is no cart yet",
                            style: poppinsText.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                                color: black),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Let’s find your favourite shoes now, do not let the promotion off before you get your shoes",
                            style: poppinsText.copyWith(
                                fontSize: 12, fontWeight: regular, color: grey),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: 38,
                margin: EdgeInsets.only(top: 16, left: 24, right: 24),
                child: CustomButton(
                    title: "Find Shoes",
                    onPress: () {
                      Navigator.pushNamed(context, "/main");
                    })),
            Container(
              margin: EdgeInsets.only(top: 32),
              height: 1,
              color: line,
            )
          ],
        ),
      );
    }

    Widget wishlistExist() {
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 24, left: 24),
                child: Text(
                  "Get your wishlist",
                  style: poppinsText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                    color: black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  Row(
                    children: fav
                        .map(
                          (data) => Container(
                            margin: EdgeInsets.only(right: 16),
                            width: MediaQuery.of(context).size.width - 48,
                            child: MainItem(
                              img: data.productImage[0].image,
                              name: data.name,
                              desc: data.desc,
                              price: data.price,
                              cat: data.category.name,
                              onPress: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(data)));
                              },
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              height: 1,
              color: line,
            )
          ],
        ),
      );
    }

    Widget emptyWishlist() {
      return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 24, left: 24),
                child: Text(
                  "Get your wishlist",
                  style: poppinsText.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                    color: black,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              height: 166,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/illustrations/ilemptywish.png"))),
            ),
            Container(
              width: 253,
              margin: EdgeInsets.only(top: 24),
              child: Text(
                "Oops, looks like, you also didn’t have wishlist yet.",
                style: poppinsText.copyWith(
                    fontSize: 14, fontWeight: regular, color: grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MiniButton(
                title: "Find Shoes",
                onPress: () {
                  Navigator.pushNamed(context, "/main");
                }),
            Container(
              margin: EdgeInsets.only(top: 26),
              height: 1,
              color: line,
            )
          ],
        ),
      );
    }

    Widget renderWishlist() {
      return emptyWish ? emptyWishlist() : wishlistExist();
    }

    Widget emptyCart() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [topEmptyCart(), renderWishlist(), bestSellerProm()],
        ),
      );
    }

    Widget renderContent() {
      return empty ? emptyCart() : cartExist();
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: !empty
            ? cartExist()
            : ListView(
                children: [
                  HeaderCustom(
                    title: "Your Cart",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  renderContent()
                ],
              ),
      ),
    );
  }
}
