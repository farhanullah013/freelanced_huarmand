import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelanced_hunarmand/widgets/product-details-screen-order-detail-container.dart';
import 'package:freelanced_hunarmand/widgets/product-images-container.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ProductDetailScreen extends StatefulWidget {
  static final String id = 'ProductDetailScreen';
  ProductDetailScreen({
    this.productName,
    this.productRating,
    this.productDetails,
    this.imageUrl,
    this.productDiscountStatus,
    this.productPrice,
    this.productQuantity,
    this.productSize,
    this.productId,
    this.containerNumber,
    this.productCategory,
  });
  final String productName;
  final String productRating;
  final String productDetails;
  final String imageUrl;
  final bool productDiscountStatus;
  final String productPrice;
  final String productQuantity;
  final String productSize;
  final String productId;
  final int containerNumber;
  final String productCategory;
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<bool> isAddedToCart = [];
  List<bool> isAddedToWishList = [];
  bool showSpinner = false;
  var _fireStore = FirebaseFirestore.instance;
  getCartValues() async {
    setState(() {
      showSpinner = true;
    });
    final productsReference = _fireStore.collection('products');
    QuerySnapshot product =
        await productsReference.where('id', isEqualTo: widget.productId).get();
    product.docs.forEach((element) {
      isAddedToCart.add(element['isAddedToCart']);
      isAddedToWishList.add(element['isAddedToWishList']);
    });
    setState(() {
      showSpinner = false;
    });
  }

  @override
  void initState() {
    setState(() {
      getCartValues();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Color(kBackgroundColor),
                  title: Text(
                    'Product Details',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => ShoppingCart()));
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: Color(kBackgroundColor), fontSize: 18),
                          ),
                          RatingBar(
                            ratingWidget: RatingWidget(
                                empty: Icon(
                                  Icons.star_border,
                                  color: Colors.amber,
                                ),
                                half: Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                ),
                                full: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                )),
                            onRatingUpdate: (value) {},
                            direction: Axis.horizontal,
                            initialRating: double.parse(
                              widget.productRating,
                            ),
                            itemCount: 5,
                            itemSize: 25,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '(${widget.productDetails})',
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      ProductImagesContainer(
                        image: widget.imageUrl,
                        isAddedToWishList: isAddedToWishList[0],
                        productId: widget.productId,
                      ),
                      ProductDetailsScreenOrderDetailsContainer(
                        productPrice: widget.productPrice,
                        productDiscountStatus: widget.productDiscountStatus,
                        productQuantity: widget.productQuantity,
                        productSize: widget.productSize,
                        context: context,
                        productName: widget.productName,
                        imageUrl: widget.imageUrl,
                        productDetails: widget.productDetails,
                        productId: widget.productId,
                        isAddedToCart: isAddedToCart[0],
                        containerNumber: widget.containerNumber,
                        productCategory: widget.productCategory,
                      ),
                    ],
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
