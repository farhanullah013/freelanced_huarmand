import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/payment-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

// ignore: must_be_immutable
class ShippingInformationScreen extends StatelessWidget {
  ShippingInformationScreen({
    Key key,
    this.imageUrl,
    this.productName,
    this.productPrice,
    this.productQuantity,
    this.productDetails,
    this.total,
    this.height,
    this.armLength,
    this.chest,
    this.collar,
    this.legHeight,
    this.shoulders,
    this.torsoHeight,
    this.waist,
  }) : super(key: key);
  String countryName;
  String firstName;
  String lastName;
  String address;
  String optionalAddress;
  String cityName;
  String zipCode;
  String emailAddress;
  String phoneNumber;
  final String imageUrl;
  final String productName;
  final String productPrice;
  final String productQuantity;
  final String productDetails;
  final int total;
  final String height;
  final String torsoHeight;
  final String legHeight;
  final String waist;
  final String armLength;
  final String chest;
  final String shoulders;
  final String collar;
  getCountryName(value) {
    countryName = value;
  }

  getFirstName(value) {
    firstName = value;
  }

  getLastName(value) {
    lastName = value;
  }

  getAddress(value) {
    address = value;
  }

  getOptionalAddress(value) {
    optionalAddress = value;
  }

  getCityName(value) {
    cityName = value;
  }

  getZipCode(value) {
    zipCode = value;
  }

  getEmailAddress(value) {
    emailAddress = value;
  }

  getPhoneNumber(value) {
    phoneNumber = value;
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
                'Shipping Information',
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
                    'Enter country name :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getCountryName,
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
                          hintText: 'Your Country Name',
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
                    'Enter first name :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getFirstName,
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
                          hintText: 'Your First Name',
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
                    'Enter last name :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getLastName,
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
                          hintText: 'Your Last Name',
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
                    'Enter Address:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getAddress,
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
                          hintText: 'Your Address',
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
                    'Enter address optional:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getOptionalAddress,
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
                          hintText: 'Your optional Address',
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
                    'Enter city name :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getCityName,
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
                          hintText: 'Your city name',
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
                    'Enter zip code :',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        onChanged: getZipCode,
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
                          hintText: 'Your zip code',
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
                    'Enter email address:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: getEmailAddress,
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
                          hintText: 'Your email address',
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
                    'Enter phone number:',
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    width: 190,
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: getPhoneNumber,
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
                          hintText: 'Your phone number',
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                                productDetails: productDetails,
                                imageUrl: imageUrl,
                                productPrice: productPrice,
                                productQuantity: productQuantity,
                                productName: productName,
                                address: address,
                                cityName: cityName,
                                countryName: countryName,
                                emailAddress: emailAddress,
                                firstName: firstName,
                                lastName: lastName,
                                optionalAddress: optionalAddress,
                                phoneNumber: phoneNumber,
                                zipCode: zipCode,
                                total: total,
                              )));
                },
                color: Color(kBackgroundColor),
                height: 50,
                minWidth: MediaQuery.of(context).size.width,
                child: Text(
                  'Continue to payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
