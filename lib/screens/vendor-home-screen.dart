import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/custom-side-drawer.dart';
import 'package:freelanced_hunarmand/widgets/productDisplayContainer.dart';

import 'add-product-screen.dart';
import 'login-screen.dart';

class VendorHomeScreen extends StatefulWidget {
  static final String id = 'VendorHomeScreen';
  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  List<Widget> getFeaturedProducts(int start, int end) {
    List<ProductDisplayContainer> popularProducts = [];
    for (int i = start; i < end; i++) {
      popularProducts.add(ProductDisplayContainer(
        image: LogInScreen.productPhoto[i],
        price: LogInScreen.productPrice[i],
        name: LogInScreen.productName[i],
        details: LogInScreen.productDetails[i],
        productCategory: LogInScreen.productCategory[i],
        containerNumber: i,
        productId: LogInScreen.productId[i],
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        productQuantity: LogInScreen.productQuantity[i],
        productSize: LogInScreen.productSize[i],
        productRating: LogInScreen.productRating[i],
        productDiscountStatus: LogInScreen.productDiscountStatus[i],
      ));
    }
    return popularProducts;
  }

  List<Widget> getActiveOrders(int start, int end) {
    List<ProductDisplayContainer> popularProducts = [];
    for (int i = start; i < end; i++) {
      popularProducts.add(ProductDisplayContainer(
        image: LogInScreen.productPhoto[i],
        price: LogInScreen.productPrice[i],
        name: LogInScreen.productName[i],
        details: LogInScreen.productDetails[i],
        productCategory: LogInScreen.productCategory[i],
        containerNumber: i,
        productId: LogInScreen.productId[i],
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        productQuantity: LogInScreen.productQuantity[i],
        productSize: LogInScreen.productSize[i],
        productRating: LogInScreen.productRating[i],
        productDiscountStatus: LogInScreen.productDiscountStatus[i],
      ));
    }
    return popularProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text('Vendor Home Screen'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Featured Products ',
                          style: TextStyle(
                              color: Color(kBackgroundColor),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.star,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getFeaturedProducts(0, 2),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Your Active Orders',
                      style: TextStyle(
                          color: Color(kBackgroundColor),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: getActiveOrders(0, 2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
