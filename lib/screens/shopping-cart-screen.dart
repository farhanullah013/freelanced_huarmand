import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/home-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/shopping-cart-product-container.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
//import 'package:freelanced_hunarmand/screens/order-summary-screen.dart';

class ShoppingCart extends StatefulWidget {
  static final String id = 'ShoppingCart';
  static List<String> dropdownValue = [];
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool showSpinner = false;
  final _fireStore = FirebaseFirestore.instance;

  List<String> productManufacturer = [];
  List<String> productCategory = [];
  List<String> productGender = [];
  List<String> productDetails = [];
  List<String> productName = [];
  List<String> productPhoto = [];
  List<String> productPrice = [];
  List<String> productQuantity = [];
  List<String> productSize = [];
  List<bool> productDiscountStatus = [];
  List<String> productRating = [];
  List<String> productId = [];
  List<bool> isAddedToCart = [];
  List<bool> isAddedToWishList = [];
  List<ShoppingCartProductContainer> cartItems = [];
  getCartItems() async {
    setState(() {
      showSpinner = true;
    });
    int loopCount = 0;
    final productsReference = _fireStore.collection('products');
    QuerySnapshot product =
    await productsReference.where('isAddedToCart', isEqualTo: true).get();
    product.docs.forEach((element) {
      productCategory.add(element['category']);
      productGender.add(element['gender']);
      productDetails.add(element['productDetails']);
      productManufacturer.add(element['productManufacturer']);
      productName.add(element['productName']);
      productPhoto.add(element['productPhoto']);
      productPrice.add(element['productPrice']);
      productQuantity.add(element['productQuantity']);
      productSize.add(element['productSize']);
      productDiscountStatus.add(element['productDiscountStatus']);
      productRating.add(element['productRating']);
      productId.add(element['id']);
      isAddedToCart.add(element['isAddedToCart']);
      isAddedToWishList.add(element['isAddedToWishList']);
      loopCount++;
    });
    if (product != null) {
      setState(() {
        for (int i = 0; i < loopCount; i++) {
          cartItems.add(ShoppingCartProductContainer(
            productPhoto: productPhoto[i],
            productPrice: productPrice[i],
            productName: productName[i],
            productDetails: productDetails[i],
            productDiscountStatus: productDiscountStatus[i],
            productRating: productRating[i],
            productSize: productSize[i],
            productQuantity: productQuantity[i],
            isAddedToCart: isAddedToCart[i],
            isAddedToWishList: isAddedToWishList[i],
            productId: productId[i],
            productCategory: productCategory[i],
            productGender: productGender[i],
            productManufacturer: productManufacturer[i],
          ));
        }
      });
    }

    setState(() {
      showSpinner = false;
    });
  }

  int getSubTotalValue() {
     int index = 0;
    int subtotal = 0;
    for (var i in productPrice) {
      subtotal =
          subtotal + int.parse(i) * int.parse(ShoppingCart.dropdownValue[index]);
      index++;
    }
    return subtotal;
  }

  @override
  void initState() {
    setState(() {
      getCartItems();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Material(
          child: ListView(
              children: cartItems.isEmpty
              ? [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  'You have no items in cart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ]
                  : [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
              height: 10,
              child: Divider(
          thickness: 1,
          height: 5,
          color: Colors.grey[600],
          ),
        ),
        Column(
          children: cartItems,
        ),
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              child: MaterialButton(
                shape: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(50))),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => OrderSummaryScreen(
                  //           productName: widget.productName,
                  //           productQuantity: dropdownValue,
                  //           productPrice: widget.productPrice,
                  //           imageUrl: widget.imageUrl,
                  //           productDetails: widget.productDetails,
                  //           productCategory: widget.productCategory,
                  //         )));




                },
                color: Color(kBackgroundColor),
                child: Text(
                  'Check Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              child: MaterialButton(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  borderSide:
                  BorderSide(color: Colors.black, width: 2),
                ),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  //Navigator.of(context).pop();
                  Navigator.pushNamed(context, HomeScreen.id);
                },
                color: Colors.white,
                child: Text(
                  'Continue Shopping',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        ],
      ),
      ],
    ),
    ),
    ),
    );
  }
}

