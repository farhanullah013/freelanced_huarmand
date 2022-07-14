import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/wishlist-product-container.dart';

class WishList extends StatefulWidget {
  static final String id = 'WishList';
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
  List<WishListProductContainer> cartItems = [];
  getCartItems() async {
    setState(() {
      showSpinner = true;
    });
    int loopCount = 0;
    final productsReference = _fireStore.collection('products');
    QuerySnapshot product = await productsReference
        .where('isAddedToWishList', isEqualTo: true)
        .get();
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
          cartItems.add(WishListProductContainer(
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
        body: Material(
          child: ListView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Color(kBackgroundColor),
                      title: Text(
                        'Wishlist',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, ShoppingCart.id);
                            },
                            child: Icon(
                              FontAwesomeIcons.shoppingCart,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
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
                                  'You have no items in wishlist',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ]
                          : cartItems,
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
