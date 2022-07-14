import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelanced_hunarmand/screens/home-screen.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/order-screen.dart';
import 'package:freelanced_hunarmand/screens/profile-screen.dart';
import 'package:freelanced_hunarmand/screens/settings-screen.dart';
import 'package:freelanced_hunarmand/screens/vendor-home-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
//import 'package:freelanced_hunarmand/screens/add-product-screen.dart';

import 'SideDrawerCustomListTile.dart';

class CustomSideDrawer extends StatefulWidget {
  @override
  _CustomSideDrawerState createState() => _CustomSideDrawerState();
}

class _CustomSideDrawerState extends State<CustomSideDrawer> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, ProfileScreen.id);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                height: 200,
                width: double.maxFinite,
                color: Color(kBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: Colors.white,
                      child: LogInScreen.userProfilePicture
                              .contains('Add Image')
                          ? Text(
                              LogInScreen.userName.split('')[0],
                              style: TextStyle(color: Colors.red, fontSize: 40),
                            )
                          : SizedBox(),
                      backgroundImage:
                          LogInScreen.userProfilePicture.contains('Add Image')
                              ? AssetImage('assets/images')
                              : NetworkImage(LogInScreen.userProfilePicture),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${LogInScreen.userName}',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      LogInScreen.userEmail,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {
                if (LogInScreen.userIsBuyer == true) {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                } else {
                  Navigator.pushReplacementNamed(context, VendorHomeScreen.id);
                }
              },
              title: Text(
                'Home',
                style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
              ),
              leadingIcon: Icon(
                Icons.home,
                color: Color(kBackgroundColor),
                size: 28,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Color(kBackgroundColor),
                size: 20,
              ),
            ),
            LogInScreen.userIsBuyer
                ? SideDrawerCustomListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, OrderScreen.id);
                    },
                    title: Text(
                      'Your Orders',
                      style: TextStyle(
                          color: Color(kBackgroundColor), fontSize: 18),
                    ),
                    leadingIcon: Icon(
                      Icons.shopping_cart,
                      color: Color(kBackgroundColor),
                      size: 28,
                    ),
                    trailingIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(kBackgroundColor),
                      size: 20,
                    ),
                  )
                : SideDrawerCustomListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, OrderScreen.id);
                    },
                    title: Text(
                      'Your Active Orders',
                      style: TextStyle(
                          color: Color(kBackgroundColor), fontSize: 18),
                    ),
                    leadingIcon: Icon(
                      Icons.shopping_cart,
                      color: Color(kBackgroundColor),
                      size: 28,
                    ),
                    trailingIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(kBackgroundColor),
                      size: 20,
                    ),
                  ),
            SideDrawerCustomListTile(
              onTap: () {
                Navigator.pushReplacementNamed(context, SettingsScreen.id);
              },
              title: Text(
                'Settings',
                style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
              ),
              leadingIcon: Icon(
                FontAwesomeIcons.cog,
                color: Color(kBackgroundColor),
                size: 25,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Color(kBackgroundColor),
                size: 20,
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {},
              title: Text(
                'Transactions',
                style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
              ),
              leadingIcon: Icon(
                FontAwesomeIcons.exchangeAlt,
                color: Color(kBackgroundColor),
                size: 28,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Color(kBackgroundColor),
                size: 20,
              ),
            ),
            LogInScreen.userIsBuyer
                ? SideDrawerCustomListTile(
                    onTap: () {
                      //Navigator.pushNamed(context, AddProduct.id);
                      Navigator.pushNamed(context, VendorHomeScreen.id);
                    },
                    title: Text(
                      'My shop',
                      style: TextStyle(
                          color: Color(kBackgroundColor), fontSize: 18),
                    ),
                    leadingIcon: Icon(
                      FontAwesomeIcons.store,
                      color: Color(kBackgroundColor),
                      size: 25,
                    ),
                    trailingIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(kBackgroundColor),
                      size: 20,
                    ),
                  )
                : SizedBox(),
            SideDrawerCustomListTile(
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, LogInScreen.id);
              },
              title: Text(
                'Log out',
                style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
              ),
              leadingIcon: Icon(
                Icons.logout,
                color: Color(kBackgroundColor),
                size: 28,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Color(kBackgroundColor),
                size: 20,
              ),
            ),
            SideDrawerCustomListTile(
              onTap: () {
                //Navigator.pushNamed(context, VendorHomeScreen.id);
              },
              title: Text(
                'About Us',
                style: TextStyle(color: Color(kBackgroundColor), fontSize: 18),
              ),
              leadingIcon: Icon(
                FontAwesomeIcons.solidAddressBook,
                color: Color(kBackgroundColor),
                size: 25,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                color: Color(kBackgroundColor),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
