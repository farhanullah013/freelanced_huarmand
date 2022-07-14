import 'dart:core';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/clothes-screen.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/screens/shoes-screen.dart';
import 'package:freelanced_hunarmand/screens/wish-list-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/custom-carousel-pro.dart';
import 'package:freelanced_hunarmand/widgets/custom-side-drawer.dart';
import 'package:freelanced_hunarmand/widgets/productDisplayContainer.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchProduct;
  bool isSearchSelected = false;
  bool isProfileUploaded = false;
  getSearchProduct(value) {
    searchProduct = value;
  }

  List<Widget> getPopularProducts(int start, int end) {
    List<ProductDisplayContainer> popularProducts = [];
    for (int i = start; i < end; i++) {
      popularProducts.add(ProductDisplayContainer(
        image: LogInScreen.productPhoto[i],
        price: LogInScreen.productPrice[i],
        name: LogInScreen.productName[i],
        details: LogInScreen.productDetails[i],
        productDiscountStatus: LogInScreen.productDiscountStatus[i],
        productRating: LogInScreen.productRating[i],
        productSize: LogInScreen.productSize[i],
        productQuantity: LogInScreen.productQuantity[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        productId: LogInScreen.productId[i],
        containerNumber: i,
        productCategory: LogInScreen.productCategory[i],
      ));
    }
    return popularProducts;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(kBackgroundColor),
          title: isSearchSelected
              ? Container(
                  width: 200,
                  child:
                  // Expanded(
                  //
                  // child:
                  Row(

                    children: [
                      Flexible(child: Icon(
                        FontAwesomeIcons.search,
                        size: 18,
                      ),),


                      SizedBox(
                        width: 10,
                      ),
                      Flexible(child:Container(
                        width: 155,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: getSearchProduct,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle:
                            TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ), ),

                    ],
                  ),
          //),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Freelanced Hunarmand',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isSearchSelected
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearchSelected = false;
                              });
                            },
                            child: Icon(Icons.clear),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearchSelected = true;
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.search,
                              size: 20,
                            ),
                          ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ShoppingCart.id);
                      },
                      child: Icon(
                        FontAwesomeIcons.shoppingCart,
                        size: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, WishList.id);
                      },
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: CustomSideDrawer(),
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width - 10,
                        child: CarouselPro(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Select Category',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 250,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                              offset: Offset(5, 10),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ClothesScreen.id);
                          },
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/images/product4.png'),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Shoes',
                                style: TextStyle(
                                  color: Color(kBackgroundColor),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 250,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                              offset: Offset(5, 10),
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ShoesScreen.id);
                          },
                          child: Column(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/product1.webp'),
                                fit: BoxFit.contain,
                                height: 130,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Clothes',
                                style: TextStyle(
                                  color: Color(kBackgroundColor),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Popular Products',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                   children: getPopularProducts(0, 2),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 450,
                    color: Color(kBackgroundColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/stop-watch.png'),
                                height: 80,
                              ),
                              Text(
                                'Flat ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Sale',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Text(
                                'End Sale in :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  CountdownFormatted(
                                      duration: Duration(hours: 6),
                                      builder: (BuildContext context,
                                          String remaining) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            remaining,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: getPopularProducts(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    'Latest Arrivals',
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                   children: getPopularProducts(0, 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
