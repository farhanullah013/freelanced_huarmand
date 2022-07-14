import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/widgets/ProductDisplayContainer.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class ShoppingCartProductContainer extends StatefulWidget {
  final String productManufacturer;
  final String productCategory;
  final String productGender;
  final String productDetails;
  final String productName;
  final String productPhoto;
  final String productPrice;
  final String productQuantity;
  final String productSize;
  final bool productDiscountStatus;
  final String productRating;
  final String productId;
  final bool isAddedToCart;
  final bool isAddedToWishList;
  ShoppingCartProductContainer({
    Key key,
    this.productId,
    this.isAddedToCart,
    this.isAddedToWishList,
    this.productDiscountStatus,
    this.productRating,
    this.productSize,
    this.productQuantity,
    this.productPrice,
    this.productDetails,
    this.productName,
    this.productCategory,
    this.productGender,
    this.productManufacturer,
    this.productPhoto,
  }) : super(key: key);

  @override
  _ShoppingCartProductContainerState createState() =>
      _ShoppingCartProductContainerState();
}

class _ShoppingCartProductContainerState
    extends State<ShoppingCartProductContainer> {
  var _fireStore = FirebaseFirestore.instance;
  String dropdownValue = '1';
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Image(
                        image: NetworkImage(widget.productPhoto),
                        fit: BoxFit.contain,
                        height: 150,
                      ),
                    ),
                    Container(
                      width: 135,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Text(
                              widget.productName,
                              style: TextStyle(
                                  color: Color(kBackgroundColor), fontSize: 21),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Text(
                              widget.productDetails,
                              style: TextStyle(
                                  color: Color(kBackgroundColor), fontSize: 18),
                            ),
                          ),




                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            child: Text(
                              widget.productDetails,
                              style: TextStyle(
                                  color: Color(kBackgroundColor), fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1.0,
                              offset: Offset(3, 6),
                              blurRadius: 2.0),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (!isAddedToWishList) {
                            _fireStore
                                .collection('products')
                                .doc(widget.productId)
                                .update(
                              {'isAddedToWishList': true},
                            );
                          } else {
                            _fireStore
                                .collection('products')
                                .doc(widget.productId)
                                .update(
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
                        child: Icon(
                          FontAwesomeIcons.solidHeart,
                          color: isAddedToWishList ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Rs.${widget.productPrice}',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
















              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   child: MaterialButton(
              //     onPressed: () {
              //       // if (!isAddedToCart) {
              //       //   _fireStore
              //       //       .collection('products')
              //       //       .doc(widget.productId)
              //       //       .update(
              //       //     {'isAddedToCart': true},
              //       //   );
              //       // } else {
              //       //   _fireStore
              //       //       .collection('products')
              //       //       .doc(widget.productId)
              //       //       .update(
              //       //     {'isAddedToCart': false},
              //       //   );
              //       // }
              //       // setState(() {
              //       //   isAddedToCart = !isAddedToCart;
              //       // });
              //       // ScaffoldMessenger.of(context).showSnackBar(
              //       //   SnackBar(
              //       //     backgroundColor: Colors.black,
              //       //     content: isAddedToCart
              //       //         ? Text('Successfully added to cart',
              //       //         style: TextStyle(
              //       //           color: Colors.white,
              //       //           fontSize: 18,
              //       //         ))
              //       //         : Text(
              //       //       'Removed from cart',
              //       //       style: TextStyle(
              //       //         color: Colors.white,
              //       //         fontSize: 18,
              //       //       ),
              //       //     ),
              //       //   ),
              //       // );
              //     },
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(
              //           30,
              //         ),
              //       ),
              //       side: isAddedToCart
              //           ? BorderSide(
              //         color: Colors.black,
              //         width: 1.0,
              //       )
              //           : BorderSide.none,
              //     ),
              //     color: isAddedToCart ? Colors.white : Color(kBackgroundColor),
              //     minWidth: MediaQuery.of(context).size.width,
              //     height: 50,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.add_shopping_cart,
              //           color: isAddedToCart ? Colors.black : Colors.white,
              //           size: 25,
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           isAddedToCart ? 'Remove From Cart' : 'Add To Cart',
              //           style: TextStyle(
              //             color: isAddedToCart ? Colors.black : Colors.white,
              //             fontSize: 20,
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),











            ],
          ),
        ),
        SizedBox(
          height: 10,
          child: Divider(
            thickness: 1,
            height: 5,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
