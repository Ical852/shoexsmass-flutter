import 'package:flutter/material.dart';
import 'package:shoexsmass/models/productmodel.dart';
import 'package:shoexsmass/pages/detail.dart';
import 'package:shoexsmass/services/productservice.dart';
import 'package:shoexsmass/shared/global.dart';
import 'package:shoexsmass/widgets/catitem.dart';
import 'package:shoexsmass/widgets/mainitem.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  var currentCat = 'all';
  List<ProductModel> data1 = [];
  List<ProductModel> def = [];
  var loading1 = false;

  void getAll() async {
    this.setState(() {
      loading1 = true;
    });
    List<ProductModel> response = await ProductService().getAll();
    this.setState(() {
      data1 = response;
      def = response;
    });
    this.setState(() {
      loading1 = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAll();
  }

  @override
  Widget build(BuildContext context) {
    Widget headContent() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find Your Shoes",
                    style: poppinsText.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                      color: grey
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Get your favourite shoes ",
                        style: poppinsText.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                          color: black
                        ),
                      ),
                      Text(
                        "Now!",
                        style: poppinsText.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                          color: black
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(
                        color: grey
                      ),
                      borderRadius: BorderRadius.circular(100 )
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 16,
                          height: 17,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icons/icsearchex.png")
                            )
                          ),
                        ),
                        SizedBox(width: 12,),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: "Find your Favorite Shoes",
                              hintStyle: poppinsText.copyWith(
                                fontSize: 14,
                                fontWeight: regular,
                                color: grey
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              color: line,
              margin: EdgeInsets.only(
                top: 24
              ),
            )
          ],
        ),
      );
    }

    Widget categoryArea() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                bottom: 16
              ),
              child: Text(
                "All Categories",
                style: poppinsText.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                  color: black
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 24,),
                  CatItem(
                title: "All Shoes",
                onPress: () {
                  this.setState(() {
                    currentCat = 'all';
                  });
                  this.setState(() {
                    data1 = def;
                  });
                },
                active: currentCat == 'all',
              ),
              CatItem(
                title: "Running",
                onPress: () {
                  this.setState(() {
                    currentCat = 'running';
                  });
                  this.setState(() {
                    data1 = def;
                    data1 = data1.where((element) => element.category.id == 1).toList();
                  });
                },
                active: currentCat == 'running',
              ),
              CatItem(
                title: "Training",
                onPress: () {
                  this.setState(() {
                    currentCat = 'training';
                  });
                   this.setState(() {
                    data1 = def;
                    data1 = data1.where((element) => element.category.id == 2).toList();
                  });
                },
                active: currentCat == 'training',
              ),
              CatItem(
                title: "Basketball",
                onPress: () {
                  this.setState(() {
                    currentCat = 'basketball';
                  });
                   this.setState(() {
                    data1 = def;
                    data1 = data1.where((element) => element.category.id == 3).toList();
                  });
                },
                active: currentCat == 'basketball',
              ),
              CatItem(
                title: "Hiking",
                onPress: () {
                  this.setState(() {
                    currentCat = 'hiking';
                  });
                   this.setState(() {
                    data1 = def;
                    data1 = data1.where((element) => element.category.id == 4).toList();
                  });
                },
                active: currentCat == 'hiking',
              ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    
    Widget itemsArea() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: 24,
          right: 24
        ),
        child: Column(
          children: [
            loading1 ? Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(16),
              height: 150,
            ) : Column(
              children: data1.map((data) => MainItem(
                img: data.productImage[0].image, 
                cat: data.category.name, 
                desc: data.desc, 
                name: data.name, 
                onPress: (){
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => DetailPage(data)
                    )
                  );
                }, 
                price: data.price))
              .toList(),
            ),
          ],
        ),
      );
    }

    return Container(
      child: ListView(
        children: [
          headContent(),
          categoryArea(),
          itemsArea(),
          SizedBox(height: 120,)
        ],
      ),
    );
  }
}