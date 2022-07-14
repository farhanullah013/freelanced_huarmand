import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'login-screen.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String fullName;
  String email;
  String password;
  String confirmPassword;
  bool showSpinner = false;
  String phoneNumber;
  getCurrentDate() {
    var now = new DateTime.now();
    String data = now.toString();
    List<String> dateTime = data.split(' ');
    String date = dateTime[0];
    return date;
  }

  getFullName(value) {
    fullName = value;
  }

  getEmail(value) {
    email = value;
  }

  getPassword(value) {
    password = value;
  }

  getConfirmPassword(value) {
    confirmPassword = value;
  }

  getPhoneNumber(value) {
    phoneNumber = value;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child:
      Material(
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
                      'Signup',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            Icons.person,
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
                                onChanged: getFullName,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Full Name',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                onChanged: getEmail,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            Icons.phone,
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
                                onChanged: getPhoneNumber,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Phone Number',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                onChanged: getPassword,
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                onChanged: getConfirmPassword,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  hintText: 'Confirm Password',
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: MaterialButton(
                      onPressed: () async {
                        if (password == confirmPassword) {
                          try {
                            setState(() {
                              showSpinner = true;
                            });
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            );
                            if (newUser != null) {
                              String id = _auth.currentUser.uid;
                              await _fireStore.collection('users').doc(id).set({
                                'joinDate': getCurrentDate(),
                                'id': id,
                                'address': 'Enter your address',
                                'firstAndLastName': fullName,
                                'email': email,
                                'isBuyer': true,
                                'phoneNumber': phoneNumber,
                                'profilePicture': 'Add Image',
                                'backgroundPicture': 'Edit Background Image'
                              });
                              setState(() {
                                showSpinner = false;
                              });
                              print('Executed till this line');
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Text(
                                          'Successfully Registered!',
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
                                            Navigator.pushReplacementNamed(
                                                context, LogInScreen.id);
                                          },
                                          elevation: 10,
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                    elevation: 10,
                                  );
                                },
                              );
                            }
                          } catch (e) {
                            List<String> error = e.toString().split(']');
                            int length = error.length;
                            setState(() {
                              showSpinner = false;
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    children: [
                                      Text(
                                        '${length == 1 ? error[1].replaceAll('String', 'Details').replaceAll('or null', '').replaceAll('is', 'are') : e}!',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
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
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 10,
                                );
                              },
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Column(
                                  children: [
                                    Text(
                                      'Password do not match!',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16),
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
                                            color: Colors.white, fontSize: 16),
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
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}
