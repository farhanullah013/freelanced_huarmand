import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:freelanced_hunarmand/screens/order-summary-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class ProductDetailsScreenOrderDetailsContainer extends StatefulWidget {
  final bool productDiscountStatus;
  final String productPrice;
  final String productQuantity;
  final String productSize;
  final BuildContext context;
  final String productName;
  final String imageUrl;
  final String productDetails;
  final String productId;
  final bool isAddedToCart;
  final int containerNumber;
  final String productCategory;
  const ProductDetailsScreenOrderDetailsContainer({
    Key key,
    this.productDiscountStatus,
    this.productPrice,
    this.productQuantity,
    this.productSize,
    this.context,
    this.productName,
    this.imageUrl,
    this.productDetails,
    this.productId,
    this.isAddedToCart,
    this.containerNumber,
    this.productCategory,
  }) : super(key: key);

  @override
  _ProductDetailsScreenOrderDetailsContainerState createState() =>
      _ProductDetailsScreenOrderDetailsContainerState();
}

class _ProductDetailsScreenOrderDetailsContainerState
    extends State<ProductDetailsScreenOrderDetailsContainer> {
  List<String> getSizes() {
    List<String> productSizes = widget.productSize.split(',');
    return productSizes;
  }

  bool isAddedToCart = false;
  getAddToCartValue() {
    setState(() {
      isAddedToCart = widget.isAddedToCart;
    });
  }

  var _fireStore = FirebaseFirestore.instance;

  String selectedSize;
  String dropdownValue = '1';
  List<Widget> getSizeContainer() {
    List<Widget> sizeContainers = [];
    for (String i in getSizes()) {
      sizeContainers.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedSize = i;
            });
            Navigator.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              border: selectedSize == i
                  ? Border.all(color: Color(kBackgroundColor))
                  : Border.all(
                      color: Colors.transparent,
                    ),
            ),
            child: Center(
              child: Text(
                '$i',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return sizeContainers;
  }

  @override
  void initState() {
    selectedSize = getSizes()[widget.containerNumber];
    getAddToCartValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      color: Colors.white,
      height: 500,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.productDiscountStatus
              ? SizedBox()
              : Text(
                  'Today Deal: Rs${widget.productPrice}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(kBackgroundColor),
                  ),
                ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Shipping for just Rs 150',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          double.parse(widget.productQuantity) > 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'In Stock',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(kBackgroundColor),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Quantity',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue,
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                  '9',
                                  '10',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    onTap: () {
                                      setState(() {
                                        dropdownValue = value;
                                      });
                                    },
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => SingleChildScrollView(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF181B20),
                              ),
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                color: Colors.white,
                                height: 150,
                                child:
                                ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Text(
                                      'Size name: $selectedSize',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Row(
                                      children: getSizeContainer(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 15,
                        ),
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Size: $selectedSize',
                              style: TextStyle(
                                  color: Color(kBackgroundColor), fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(kBackgroundColor),
                              size: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                         if (!isAddedToCart) {
                          _fireStore
                              .collection('products')
                              .doc(widget.productId)
                            .update(
                            {'isAddedToCart': true},
                           );
                         } else {
                           _fireStore
                               .collection('products')
                               .doc(widget.productId)
                               .update(
                             {'isAddedToCart': false},
                           );
                         }
                         setState(() {
                           isAddedToCart = !isAddedToCart;
                         });
                         ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(backgroundColor: Colors.black,
                             content: isAddedToCart
                                 ? Text('Successfully added to cart',
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 18,
                                     ))
                        : Text(
                                     'Removed from cart',
                               style: TextStyle(
                             color: Colors.white,
                                       fontSize: 18,
                                     ),
                                   ),
                           ),
                         );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                        side: isAddedToCart
                            ? BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              )
                            : BorderSide.none,
                      ),
                      color: isAddedToCart
                          ? Colors.white
                          : Color(kBackgroundColor),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart,
                            color: isAddedToCart ? Colors.black : Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            isAddedToCart ? 'Remove From Cart' : 'Add To Cart',
                            style: TextStyle(
                              color:
                                  isAddedToCart ? Colors.black : Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                      color: Color(kBackgroundColor),
                      onPressed: () {
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => OrderSummaryScreen(
                                       productName: widget.productName,
                                       productQuantity: dropdownValue,
                                       productPrice: widget.productPrice,
                                       imageUrl: widget.imageUrl,
                                       productDetails: widget.productDetails,
                                       productCategory: widget.productCategory,
                                     )));
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Text(
                  'Out of stock',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(kBackgroundColor),
                  ),
                ),
        ],
      ),
    );
  }
}
