import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/payment-screen.dart';
import 'package:freelanced_hunarmand/screens/shipping-information-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class CustomerMeasurementScreen extends StatefulWidget {
  const CustomerMeasurementScreen({
    Key key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.total,
  }) : super(key: key);
  final String imageUrl;

  final String productName;

  final String productPrice;

  final String productQuantity;

  final String productDetails;

  final int total;

  @override
  _CustomerMeasurementScreenState createState() =>
      _CustomerMeasurementScreenState();
}

class _CustomerMeasurementScreenState extends State<CustomerMeasurementScreen> {
  String height;

  String torsoHeight;

  String legHeight;

  String shoulders;

  String chest;

  String waist;

  String armLength;

  String collar;

  getHeight(value) {
    height = value;
  }

  getTorsoHeight(value) {
    torsoHeight = value;
  }

  getLegHeight(value) {
    legHeight = value;
  }

  getShoulders(value) {
    shoulders = value;
  }

  getChest(value) {
    chest = value;
  }

  getWaist(value) {
    waist = value;
  }

  getArmLength(value) {
    armLength = value;
  }

  getCollar(value) {
    collar = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color(kBackgroundColor),
              title: Text(
                'Measurements Screen',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter your height :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getHeight,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your height in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter torso height',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getTorsoHeight,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your torso height',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter leg height :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getLegHeight,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your leg height',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter shoulders:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getShoulders,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your shoulders in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter your chest:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getChest,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your chest in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter your waist :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getWaist,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your waist in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter arms length :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getArmLength,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your arms length in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Enter your collar:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        onChanged: getCollar,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: 'Your your collar in centimeters',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.all(color: Color(kBackgroundColor)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShippingInformationScreen(
                                productDetails: widget.productDetails,
                                imageUrl: widget.imageUrl,
                                productPrice: widget.productPrice,
                                productQuantity: widget.productQuantity,
                                productName: widget.productName,
                                legHeight: legHeight,
                                waist: waist,
                                height: height,
                                armLength: armLength,
                                chest: chest,
                                torsoHeight: torsoHeight,
                                shoulders: shoulders,
                                collar: collar,
                              )));
                },
                color: Color(kBackgroundColor),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  'Continue to shipping',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
