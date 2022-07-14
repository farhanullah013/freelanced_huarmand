import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:freelanced_hunarmand/screens/product-detail-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/cloth-container.dart';
import 'package:freelanced_hunarmand/widgets/select-filter.dart';

import 'login-screen.dart';

class ClothesScreen extends StatefulWidget {
  static final String id = 'ProductsScreen';
  @override
  _ClothesScreenState createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> {
  bool isSearchSelected = false;
  getSearchProduct(value) {
    searchProduct = value;
  }

  List<Widget> getClothesProducts() {
    int loopCount = -1;
    List<ClothContainer> popularProducts = [];
    for (var i in LogInScreen.productCategory) {
      loopCount += 1;
      if (i == 'Clothes') {
        popularProducts.add(ClothContainer(
          imageUrl: LogInScreen.productPhoto[loopCount],
          productPrice: LogInScreen.productPrice[loopCount],
          productName: LogInScreen.productName[loopCount],
          productDetails: LogInScreen.productDetails[loopCount],
          productDiscountedPrice: LogInScreen.productPrice[loopCount],
          isDiscountAvailable: LogInScreen.productDiscountStatus[loopCount],
          productRating: LogInScreen.productRating[loopCount],
          productId: LogInScreen.productId[loopCount],
        ));
      }
    }
    if (popularProducts.isEmpty) {
      return null;
    } else {
      return popularProducts;
    }
  }

  String searchProduct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(kBackgroundColor),
        title: isSearchSelected
            ? Container(
                width: 200,
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.search,
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
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
                    ),
                  ],
                ),
              )
            : Text(
                'Shoes',
                style: TextStyle(color: Colors.white),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaterialButton(
                height: 60,
                elevation: 10,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: SelectFilter(),
                      ),
                    ),
                  );
                },
                color: Colors.white,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.dehaze,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Filter',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: getClothesProducts() == null
                      ? [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 30),
                            child: Text(
                              'No Products added yet',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                              ),
                            ),
                          )
                        ]
                      : getClothesProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
