import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/home-screen.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/screens/add-product-screen.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/vendor-home-screen.dart';
import 'package:freelanced_hunarmand/screens/wish-list-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class MySplashScreen extends StatefulWidget {
  static final String id = 'MySplashScreen';
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  getProducts() async {}
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, LogInScreen.id);
      //Navigator.pushReplacementNamed(context, ShoppingCart.id);
      //Navigator.pushReplacementNamed(context, HomeScreen.id);
      //Navigator.pushReplacementNamed(context, WishList.id);
      //Navigator.pushReplacementNamed(context, VendorHomeScreen.id);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
