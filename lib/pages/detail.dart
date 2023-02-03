import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shoexsmass/cubit/cart_cubit.dart';
import 'package:shoexsmass/cubit/product_cubit.dart';
import 'package:shoexsmass/models/cartmodel.dart';
import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/backbutton.dart';
import 'package:shoexsmass/widgets/favbutton.dart';
import 'package:shoexsmass/widgets/sizebutton.dart';
import 'package:shoexsmass/widgets/tagcat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {

  ProductModel product;
  DetailPage(this.product);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var allsizes = ["38", "39", "40", "41", "42", "43", "44", "45"];
  var sizeSelected = "38";
  var familiarShoes = [
    "assets/dummy/dummyfam1.png",
    "assets/dummy/dummyfam2.png",
    "assets/dummy/dummyfam3.png",
    "assets/dummy/dummyfam4.png",
    "assets/dummy/dummyfam5.png",
    "assets/dummy/dummyfam6.png",
    "assets/dummy/dummyfam7.png",
  ];
  
  var currentImage = '';

  @override
  void initState() {
    super.initState();
    currentImage = widget.product.productImage[0].image;
  }

  @override
  Widget build(BuildContext context) {
    var favorited = context.read<ProductCubit>().isSelected(widget.product);
    var cart = CartModel.set(widget.product, 1);
    var carted = context.read<CartCubit>().isSelected(cart);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 24,
          right: 24
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonCustom(onPress: (){
              Navigator.pop(context);
            }, secondary: true,),
            Text(
              "Detail Product",
              style: poppinsText.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
                color: black
              ),
            ),
            GestureDetector(
              onTap: (){
                var cart = CartModel.set(widget.product, 1);
                if (carted) {
                  context.read<CartCubit>().removeCart(cart);
                } else {
                  context.read<CartCubit>().addCart(cart);
                }
                this.setState(() {
                  carted = context.read<CartCubit>().isSelected(cart);
                });
              },
              child: Container(
                height: 26,
                width: 26,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: black.withOpacity(0.2),
                      blurRadius: 2,
                      offset: Offset(0, 2))
                  ],
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Center(
                  child: Icon(Icons.shopping_bag_rounded, color: carted ? orange1 : black,),
                ),
              ),
            )
          ],
        ),
      );
    }
    
    Widget productShow() {
      return Container(
        padding: EdgeInsets.only(
          top: 24,
          left: 16,
          right: 16,
          bottom: 16
        ),
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        height: 245,
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
          children: [
            Container(
              height: 127,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentImage),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Row(
                  children: widget.product.productImage.map((data) => 
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              this.setState(() {
                                currentImage = data.image;
                              });
                            },
                            child: Container(
                              height: 54,
                              width: 54,
                              decoration: BoxDecoration(
                                color: line,
                                borderRadius: BorderRadius.circular(12)
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data.image)
                                )
                              ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                        ],
                      ),
                    )
                  ).toList(),
                ),
              ],
            )
          ],
        ),
      );
    }
    
    Widget productDetails() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: poppinsText.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                        color: black
                      ),
                    ),
                    SizedBox(height: 3,),
                    TagCat(title: widget.product.category.name)
                  ],
                ),
                FavButton(
                  active: favorited,
                  onPress: () {
                    context.read<ProductCubit>().addFav(widget.product);
                    this.setState(() {
                      favorited = context.read<ProductCubit>().isSelected(widget.product);
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 24,),
            Text(
              "Description",
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
                color: black
              ),
            ),
            SizedBox(height: 11,),
            Text(
              "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
              style: poppinsText.copyWith(
                fontSize: 14,
                fontWeight: light,
                color: grey
              ),
            )
          ],
        ),
      );
    }

    Widget sizeArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 24
              ),
              child: Text(
                "Select Size",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            SizedBox(height: 8,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 24,),
                  Row(
                    children: allsizes.map((e) => 
                      SizeButton(
                        size: e,
                        onPress: () {
                          this.setState(() {
                            sizeSelected = e;
                          });
                        },
                        active: sizeSelected == e,
                      ),
                    ).toList(),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget familiarArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 24,
                bottom: 16
              ),
              child: Text(
                "Familiar Shoes",
                style: poppinsText.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold,
                  color: black
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 24,),
                  Row(
                    children: familiarShoes.map((e) => 
                    GestureDetector(
                    onTap: (){
                      this.setState(() {
                        currentImage = e;
                      });
                    },
                    child: Container(
                      height: 54,
                      width: 54,
                      margin: EdgeInsets.only(
                        right: 16
                      ),
                      decoration: BoxDecoration(
                        color: line,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(e)
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      ),
                    ),
                    ),).toList(),
                  ),
                  SizedBox(width: 12,),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget bottomButton() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 15
        ),
        height: 70,
        margin: EdgeInsets.only(
          top: 14,
        ),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.9),
              blurRadius: 9,
              offset: Offset(0, 9))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "IDR. " + formatter(widget.product.price),
              style: poppinsText.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
                color: orange1
              ),
            ),
            GestureDetector(
              onTap: () {
                CartModel newCart = new CartModel.set(widget.product, 1);
                context.read<CartCubit>().addCart(newCart);
                this.setState(() {
                  carted = context.read<CartCubit>().isSelected(cart);
                });
                Navigator.pushNamed(context, "/cart");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 8
                ),
                height: 40,
                width: 165,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [orange2, orange1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 6
                      ),
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/icons/icshop.png")
                        )
                      ),
                    ),
                    Text(
                      "Add to Cart",
                      style: poppinsText.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: white
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            productShow(),
            productDetails(),
            sizeArea(),
            familiarArea(),
            bottomButton()
          ],
        ),
      ),
    );
  }
}