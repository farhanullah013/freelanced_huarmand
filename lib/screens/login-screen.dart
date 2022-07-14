import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freelanced_hunarmand/screens/forgot-password-screen.dart';
import 'package:freelanced_hunarmand/screens/home-screen.dart';
import 'package:freelanced_hunarmand/screens/sign-up-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:freelanced_hunarmand/screens/vendor-home-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogInScreen extends StatefulWidget {
  static final String id = 'LogInScreen';
  static String userName;
  static String userEmail;
  static String userAddress;
  static String userBackgroundPicture;
  static String userId;
  static bool userIsBuyer;
  static String userJoinDate;
  static String userPhoneNumber;
  static String userProfilePicture;
  static List<String> productCategory = [];
  static List<String> productGender = [];
  static List<String> productDetails = [];
  static List<String> productManufacturer = [];
  static List<String> productName = [];
  static List<String> productPhoto = [];
  static List<String> productPrice = [];
  static List<String> productQuantity = [];
  static List<String> productSize = [];
  static List<bool> productDiscountStatus = [];
  static List<String> productRating = [];
  static List<String> productId = [];
  static List<bool> isAddedToCart = [];
  static List<bool> isAddedToWishList = [];
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _fireStore = FirebaseFirestore.instance;
  getCurrentDate() {
    var now = new DateTime.now();
    String data = now.toString();
    List<String> dateTime = data.split(' ');
    String date = dateTime[0];
    return date;
  }

  final googleAuth = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  onChangedEmail(value) {
    email = value;
  }

  onChangedPassword(value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child:Material(
        color: Colors.white,

        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Color(kBackgroundColor).withOpacity(0.7),
              ),
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Image.asset(
                      'assets/images/logo-removebg.png',
                      colorBlendMode: BlendMode.dstATop,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: 55,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            height: 50,
                            width: 300,
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                onChanged: (value) {
                                  onChangedEmail(value);
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: 55,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 30,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            height: 50,
                            width: 300,
                            child: Material(
                              color: Colors.transparent,
                              child: TextField(
                                obscureText: true,
                                onChanged: (value) {
                                  onChangedPassword(value);
                                },
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          setState(() {
                            showSpinner = true;
                          });
                          final user = await _auth.signInWithEmailAndPassword(
                            email: email,
                            password: password,
                          );

                          if (user != null) {
                            try {
                              final user = _auth.currentUser;
                              if (user != null) {
                                final collectionReference =
                                    _fireStore.collection('users');
                                QuerySnapshot users = await collectionReference
                                    .where('id', isEqualTo: user.uid)
                                    .get();
                                users.docs.forEach((element) {
                                  LogInScreen.userName =
                                      element['firstAndLastName'];
                                  LogInScreen.userAddress = element['address'];
                                  LogInScreen.userBackgroundPicture =
                                      element['backgroundPicture'];
                                  LogInScreen.userEmail = element['email'];
                                  LogInScreen.userId = element['id'];
                                  LogInScreen.userIsBuyer = element['isBuyer'];
                                  LogInScreen.userJoinDate =
                                      element['joinDate'];
                                  LogInScreen.userPhoneNumber =
                                      element['phoneNumber'];
                                  LogInScreen.userProfilePicture =
                                      element['profilePicture'];
                                });
                                final productsReference =
                                    _fireStore.collection('products');
                                QuerySnapshot product =
                                    await productsReference.get();
                                product.docs.forEach((element) {
                                  LogInScreen.productCategory
                                      .add(element['category']);
                                  LogInScreen.productGender
                                      .add(element['gender']);
                                  LogInScreen.productDetails
                                      .add(element['productDetails']);
                                  LogInScreen.productManufacturer
                                      .add(element['productManufacturer']);
                                  LogInScreen.productName
                                      .add(element['productName']);
                                  LogInScreen.productPhoto
                                      .add(element['productPhoto']);
                                  LogInScreen.productPrice
                                      .add(element['productPrice']);
                                  LogInScreen.productQuantity
                                      .add(element['productQuantity']);
                                  LogInScreen.productSize
                                      .add(element['productSize']);
                                  LogInScreen.productDiscountStatus
                                      .add(element['productDiscountStatus']);
                                  LogInScreen.productRating
                                      .add(element['productRating']);
                                  LogInScreen.productId.add(element['id']);
                                  LogInScreen.isAddedToCart
                                      .add(element['isAddedToCart']);
                                  LogInScreen.isAddedToWishList
                                      .add(element['isAddedToWishList']);
                                });
                              }
                            } catch (e) {
                              print(e);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                            if (LogInScreen.userIsBuyer == true) {
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.id);
                            } else {












                              // Navigator.pushReplacementNamed(
                              //     context, HomeScreen.id);

                              Navigator.pushReplacementNamed(
                                  context, VendorHomeScreen.id);
                            }
                          }
                        } catch (e) {
                          setState(() {
                            showSpinner = false;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    children: [
                                      Text(
                                        'Failed to authenticate!',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.0)),
                                        ),
                                        minWidth: 90,
                                        height: 40,
                                        color: Color(kBackgroundColor),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        elevation: 10,
                                        child: Text(
                                          'Try Again',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 10,
                                );
                              },
                            );
                          });
                        }
                      },
                      color: Colors.white,
                      height: 55,
                      minWidth: MediaQuery.of(context).size.width - 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Center(
                      child: Text(
                        'or login with',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              try {
                                final GoogleSignInAccount googleUser =
                                    await GoogleSignIn().signIn();
                                final GoogleSignInAuthentication googleAuth =
                                    await googleUser.authentication;
                                final GoogleAuthCredential credential =
                                    GoogleAuthProvider.credential(
                                  accessToken: googleAuth.accessToken,
                                  idToken: googleAuth.idToken,
                                );
                                _auth.signInWithCredential(credential);
                                String id = _auth.currentUser.uid;
                                setState(() {
                                  showSpinner = true;
                                });
                                await _fireStore
                                    .collection('users')
                                    .doc(id)
                                    .set({
                                  'joinDate': getCurrentDate(),
                                  'id': id,
                                  'address': 'Enter your address',
                                  'firstAndLastName':
                                      _auth.currentUser.displayName,
                                  'email': _auth.currentUser.email,
                                  'isBuyer': true,
                                  'phoneNumber': 'Enter your phone number',
                                  'profilePicture': 'Add Image',
                                  'backgroundPicture': 'Edit Background Image'
                                });
                                final collectionReference =
                                    _fireStore.collection('users');
                                QuerySnapshot users = await collectionReference
                                    .where('id', isEqualTo: id)
                                    .get();
                                users.docs.forEach((element) {
                                  LogInScreen.userName =
                                      element['firstAndLastName'];
                                  LogInScreen.userAddress = element['address'];
                                  LogInScreen.userBackgroundPicture =
                                      element['backgroundPicture'];
                                  LogInScreen.userEmail = element['email'];
                                  LogInScreen.userId = element['id'];
                                  LogInScreen.userIsBuyer = element['isBuyer'];
                                  LogInScreen.userJoinDate =
                                      element['joinDate'];
                                  LogInScreen.userPhoneNumber =
                                      element['phoneNumber'];
                                  LogInScreen.userProfilePicture =
                                      element['profilePicture'];
                                });
                                final productsReference =
                                    _fireStore.collection('products');
                                QuerySnapshot product =
                                    await productsReference.get();
                                product.docs.forEach((element) {
                                  LogInScreen.productCategory
                                      .add(element['category']);
                                  LogInScreen.productGender
                                      .add(element['gender']);
                                  LogInScreen.productDetails
                                      .add(element['productDetails']);
                                  LogInScreen.productManufacturer
                                      .add(element['productManufacturer']);
                                  LogInScreen.productName
                                      .add(element['productName']);
                                  LogInScreen.productPhoto
                                      .add(element['productPhoto']);
                                  LogInScreen.productPrice
                                      .add(element['productPrice']);
                                  LogInScreen.productQuantity
                                      .add(element['productQuantity']);
                                  LogInScreen.productSize
                                      .add(element['productSize']);
                                  LogInScreen.productDiscountStatus
                                      .add(element['productDiscountStatus']);
                                  LogInScreen.productRating
                                      .add(element['productRating']);
                                  LogInScreen.productId.add(element['id']);
                                  LogInScreen.isAddedToCart
                                      .add(element['isAddedToCart']);
                                  LogInScreen.isAddedToWishList
                                      .add(element['isAddedToWishList']);
                                });
                                setState(() {
                                  showSpinner = false;
                                });

                                if (LogInScreen.userIsBuyer == true) {
                                  Navigator.pushReplacementNamed(
                                      context, HomeScreen.id);
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, VendorHomeScreen.id);
                                }
                              } catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Column(
                                        children: [
                                          Text(
                                            'Error! Please try again.',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.0))),
                                            minWidth: 90,
                                            height: 40,
                                            color: Color(kBackgroundColor),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            elevation: 10,
                                            child: Text(
                                              'Try Again',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                          ),
                                        ],
                                      ),
                                      elevation: 10,
                                    );
                                  },
                                );
                              }
                            },
                            child: Image.asset(
                              'assets/images/google-plus-logo.png',
                              width: 35,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                final result =
                                    await FacebookAuth.instance.login();
                                final FacebookAuthCredential
                                    facebookAuthCredential =
                                    FacebookAuthProvider.credential(
                                        result.token);

                                _auth
                                    .signInWithCredential(
                                        facebookAuthCredential)
                                    .then((value) async {
                                  String id = _auth.currentUser.uid;
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  bool authenticated = false;
                                  while (!authenticated) {
                                    await _fireStore
                                        .collection('users')
                                        .doc(id)
                                        .set({
                                      'joinDate': getCurrentDate(),
                                      'id': id,
                                      'address': 'Enter your address',
                                      'firstAndLastName':
                                          _auth.currentUser.displayName,
                                      'email': _auth.currentUser.email,
                                      'isBuyer': true,
                                      'phoneNumber': 'Enter your phone number',
                                      'profilePicture': 'Add Image',
                                      'backgroundPicture':
                                          'Edit Background Image'
                                    });
                                    authenticated = true;
                                  }
                                  final collectionReference =
                                      _fireStore.collection('users');
                                  QuerySnapshot users =
                                      await collectionReference
                                          .where('id', isEqualTo: id)
                                          .get();
                                  users.docs.forEach((element) {
                                    LogInScreen.userName =
                                        element['firstAndLastName'];
                                    LogInScreen.userAddress =
                                        element['address'];
                                    LogInScreen.userBackgroundPicture =
                                        element['backgroundPicture'];
                                    LogInScreen.userEmail = element['email'];
                                    LogInScreen.userId = element['id'];
                                    LogInScreen.userIsBuyer =
                                        element['isBuyer'];
                                    LogInScreen.userJoinDate =
                                        element['joinDate'];
                                    LogInScreen.userPhoneNumber =
                                        element['phoneNumber'];
                                    LogInScreen.userProfilePicture =
                                        element['profilePicture'];
                                  });
                                  final productsReference =
                                      _fireStore.collection('products');

                                  QuerySnapshot product =
                                      await productsReference.get();
                                  product.docs.forEach((element) {
                                    LogInScreen.productCategory
                                        .add(element['category']);
                                    LogInScreen.productGender
                                        .add(element['gender']);
                                    LogInScreen.productDetails
                                        .add(element['productDetails']);
                                    LogInScreen.productManufacturer
                                        .add(element['productManufacturer']);
                                    LogInScreen.productName
                                        .add(element['productName']);
                                    LogInScreen.productPhoto
                                        .add(element['productPhoto']);
                                    LogInScreen.productPrice
                                        .add(element['productPrice']);
                                    LogInScreen.productQuantity
                                        .add(element['productQuantity']);
                                    LogInScreen.productSize
                                        .add(element['productSize']);
                                    LogInScreen.productDiscountStatus
                                        .add(element['productDiscountStatus']);
                                    LogInScreen.productRating
                                        .add(element['productRating']);
                                    LogInScreen.productId.add(element['id']);
                                    LogInScreen.isAddedToCart
                                        .add(element['isAddedToCart']);
                                    LogInScreen.isAddedToWishList
                                        .add(element['isAddedToWishList']);
                                  });
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  if (LogInScreen.userIsBuyer == true) {
                                    Navigator.pushReplacementNamed(
                                        context, HomeScreen.id);
                                  } else {
                                    Navigator.pushReplacementNamed(
                                        context, VendorHomeScreen.id);
                                  }
                                }).catchError((e) {
                                  if (e.toString().contains(
                                      '[firebase_auth/account-exists-with-different-credential]')) {}
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Column(
                                          children: [
                                            Text(
                                              e.toString().contains(
                                                      '[firebase_auth/account-exists-with-different-credential]')
                                                  ? 'Account already exists with same email address'
                                                  : 'Failed to authenticate!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              7.0))),
                                              minWidth: 90,
                                              height: 40,
                                              color: Color(kBackgroundColor),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              elevation: 10,
                                              child: Text(
                                                'Try Again',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ),
                                          ],
                                        ),
                                        elevation: 10,
                                      );
                                    },
                                  );
                                });
                              } catch (e) {}
                            },
                            child: Image.asset(
                              'assets/images/facebook-logo.png',
                              width: 40,
                            ),
                          ),
                          Image.asset(
                            'assets/images/twitter-logo.png',
                            width: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SignUpScreen.id);
                          },
                          child: Text(
                            'Register now ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
