import 'package:flutter/material.dart';

class OrderHistoryItems extends StatelessWidget {
  OrderHistoryItems({
    this.itemPicture,
    this.productDetails,
    this.deliveryDate,
    this.orderId,
    this.returnDate,
  });
  final Widget itemPicture;
  final String productDetails;
  final String deliveryDate;
  final String returnDate;
  final String orderId;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              itemPicture,
              SizedBox(
                width: 15,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetails,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Delivered on $deliveryDate',
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    Text('Return policy valid till $returnDate'),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Buy it again',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order id',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  orderId,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey,
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
