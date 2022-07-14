import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/product-detail-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class ClothContainer extends StatefulWidget {
  ClothContainer({
    this.imageUrl,
    this.productDetails,
    this.productDiscountedPrice,
    this.productName,
    this.productPrice,
    this.productRating,
    this.isDiscountAvailable,
    this.productId,
  });
  final String imageUrl;
  final String productName;
  final String productDetails;
  final String productRating;
  final String productPrice;
  final String productDiscountedPrice;
  final bool isDiscountAvailable;
  final String productId;
  @override
  _ClothContainerState createState() =>
      _ClothContainerState();
}

class _ClothContainerState extends State<ClothContainer> {
  int loopCount = -1;
  getLoopCountValue() {
    for (var i in LogInScreen.productId) {
      loopCount += 1;
      if (widget.productId == LogInScreen.productId[loopCount]) {
        break;
      }
    }
  }

  @override
  void initState() {
    getLoopCountValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                      productName: LogInScreen.productName[loopCount],
                      productRating: LogInScreen.productRating[loopCount],
                      productDetails: LogInScreen.productDetails[loopCount],
                      imageUrl: LogInScreen.productPhoto[loopCount],
                      productDiscountStatus:
                          LogInScreen.productDiscountStatus[loopCount],
                      productPrice: LogInScreen.productPrice[loopCount],
                      productQuantity: LogInScreen.productQuantity[loopCount],
                      productSize: LogInScreen.productSize[loopCount],
                      productId: LogInScreen.productId[loopCount],
                      containerNumber: loopCount,
                    )));
      },
      child: Container(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Image(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.contain,
                    width: 120,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                              color: Color(kBackgroundColor), fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ),
                          child: Text(
                            widget.productDetails,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        RatingBarIndicator(
                          itemPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          rating: double.parse(widget.productPrice),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                          itemCount: 5,
                          itemSize: 23,
                          direction: Axis.horizontal,
                        ),
                        widget.isDiscountAvailable
                            ? Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      '\$${widget.productDiscountedPrice}',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      '\$${widget.productPrice}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: Text(
                                  '\$ ${widget.productPrice}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
