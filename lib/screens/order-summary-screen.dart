import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/customer-measurments-screen.dart';
import 'package:freelanced_hunarmand/screens/shipping-information-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

// ignore: must_be_immutable
class OrderSummaryScreen extends StatelessWidget {
  static final String id = 'OrderSummaryScreen';
  OrderSummaryScreen({
    Key key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.productCategory,
    this.total,
  }) : super(key: key);
  final String imageUrl;
  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productDetails;
  final String productCategory;
  int total;
  int getSubtotal() {
    int subTotal = int.parse(productQuantity) * int.parse(productPrice);
    return subTotal;
  }

  getTotal() {
    total = getSubtotal() + 150;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AppBar(
                backgroundColor: Color(kBackgroundColor),
                title: Text('CHECKOUT'),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(
                          color: Color(kBackgroundColor),
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(imageUrl),
                            height: 180,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  productDetails,
                                  style: TextStyle(
                                    color: Color(kBackgroundColor),
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Rs$productPrice',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rs${getSubtotal()}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Rs150',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Rs${getTotal()}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 50,
              ),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                onPressed: () {
                  if (productCategory == 'Clothes') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingInformationScreen(
                                productName: productName,
                                productQuantity: productQuantity,
                                productPrice: productPrice,
                                imageUrl: imageUrl,
                                productDetails: productDetails,
                                total: total)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShippingInformationScreen(
                                productName: productName,
                                productQuantity: productQuantity,
                                productPrice: productPrice,
                                imageUrl: imageUrl,
                                productDetails: productDetails,
                                total: total)));
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CustomerMeasurementScreen(
                    //             productName: productName,
                    //             productQuantity: productQuantity,
                    //             productPrice: productPrice,
                    //             imageUrl: imageUrl,
                    //             productDetails: productDetails,
                    //             total: total)));
                  }
                },
                minWidth: 250,
                height: 50,
                color: Color(kBackgroundColor),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
