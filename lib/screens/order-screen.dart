import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/custom-side-drawer.dart';
import 'package:freelanced_hunarmand/widgets/order-history-items.dart';

class OrderScreen extends StatefulWidget {
  static final String id = 'OrderScreen';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSideDrawer(),
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text(
          'My Orders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              OrderHistoryItems(
                deliveryDate: 'Feb 14',
                itemPicture: Image(
                  image: AssetImage('assets/images/order1.jpg'),
                  width: 130,
                ),
                orderId: '0000012345',
                returnDate: 'Feb 11',
                productDetails: 'Red Shirt(Large Size)',
              ),
              OrderHistoryItems(
                deliveryDate: 'Feb 14',
                itemPicture: Image(
                  image: AssetImage('assets/images/order2.png'),
                  width: 130,
                ),
                orderId: '0000022345',
                returnDate: 'Feb 11',
                productDetails: 'Blue Shirt(Large Size)',
              ),
              OrderHistoryItems(
                deliveryDate: 'Feb 14',
                itemPicture: Image(
                  image: AssetImage('assets/images/order3.jpg'),
                  width: 130,
                ),
                orderId: '0000032345',
                returnDate: 'Feb 11',
                productDetails: 'Blue Jeans(Male Size : 32)',
              ),
              OrderHistoryItems(
                deliveryDate: 'Feb 14',
                itemPicture: Image(
                  image: AssetImage('assets/images/order4.jpg'),
                  width: 130,
                ),
                orderId: '0000042345',
                returnDate: 'Feb 11',
                productDetails: 'Blue Jeans(Ladies Size: 30)',
              ),
              OrderHistoryItems(
                deliveryDate: 'Feb 14',
                itemPicture: Image(
                  image: AssetImage('assets/images/order5.jpg'),
                  width: 107,
                ),
                orderId: '0000052345',
                returnDate: 'Feb 11',
                productDetails: 'Black Leather Jacket (Large Size)',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
