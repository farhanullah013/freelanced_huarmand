import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductImagesContainer extends StatefulWidget {
  ProductImagesContainer({
    this.image,
    this.isAddedToWishList,
    this.productId,
  });
  final String image;
  final bool isAddedToWishList;
  final String productId;

  @override
  _ProductImagesContainerState createState() => _ProductImagesContainerState();
}

class _ProductImagesContainerState extends State<ProductImagesContainer> {
  var _fireStore = FirebaseFirestore.instance;
  bool isAddedToWishList = false;
  getAddToWishListValue() {
    setState(() {
      isAddedToWishList = widget.isAddedToWishList;
    });
  }

  @override
  void initState() {
    getAddToWishListValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 400,
      width: 500,
      //width:MediaQuery.of(context).size.width,
      child:
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Center(
                        child: Image(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.contain,
                          height: 260,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              height: 350,
              width: 300,
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
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              if (!isAddedToWishList) {
                _fireStore.collection('products').doc(widget.productId).update(
                  {'isAddedToWishList': true},
                );
              } else {
                _fireStore.collection('products').doc(widget.productId).update(
                  {'isAddedToWishList': false},
                );
              }
              setState(() {
                isAddedToWishList = !isAddedToWishList;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black,
                  content: isAddedToWishList
                      ? Text('Successfully added to Wishlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ))
                      : Text(
                          'Removed from Wishlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Icons.favorite,
                color: isAddedToWishList == true ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
