import 'package:flutter/material.dart';
// import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/product-detail-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class ProductDisplayContainer extends StatelessWidget {
  ProductDisplayContainer({
    this.image,
    this.name,
    this.price,
    this.details,
    this.productQuantity,
    this.productSize,
    this.productRating,
    this.productDiscountStatus,
    this.isAddedToCart,
    this.isAddedToWishList,
    this.productId,
    this.containerNumber,
    this.productCategory,
  });
  final String image;
  final String name;
  final String price;
  final String details;
  final String productRating;
  final String productSize;
  final String productQuantity;
  final bool productDiscountStatus;
  final String productId;
  final bool isAddedToCart;
  final bool isAddedToWishList;
  final int containerNumber;
  final String productCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              productDetails: details,
              imageUrl: image,
              productPrice: price,
              productName: name,
              productQuantity: productQuantity,
              productSize: productSize,
              productRating: productRating,
              productDiscountStatus: productDiscountStatus,
              productId: productId,
              containerNumber: containerNumber,
              productCategory: productCategory,
            ),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Image(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                    height: 170,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    name,
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 15,
                  ),
                  child: Text(
                    details,
                    style:
                        TextStyle(color: Color(kBackgroundColor), fontSize: 16),
                  ),
                ),
              ],
            ),
            height: 300,
            width: 245,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                  offset: Offset(5, 15),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
            height: 320,
          ),
        ],
      ),
    );
  }
}
