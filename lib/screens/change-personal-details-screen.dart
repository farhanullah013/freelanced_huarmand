import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';

class ChangePersonalDetails extends StatefulWidget {
  static final String id = 'ChangePersonalDetails';
  @override
  _ChangePersonalDetailsState createState() => _ChangePersonalDetailsState();
}

class _ChangePersonalDetailsState extends State<ChangePersonalDetails> {
  final _fireStore = FirebaseFirestore.instance;
  String firstAndLastName = LogInScreen.userName;
  String address = LogInScreen.userAddress;
  String email = LogInScreen.userEmail;
  String phone = LogInScreen.userPhoneNumber;
  String password;
  bool isBuyer = LogInScreen.userIsBuyer;
  getCurrentDate() {
    var now = new DateTime.now();
    String data = now.toString();
    List<String> dateTime = data.split(' ');
    String date = dateTime[0];
    return date;
  }

  getPassword(value) {
    password = value;
  }

  getFirstAndLastName(value) {
    firstAndLastName = value;
  }

  getAddress(value) {
    address = value;
  }

  getEmail(value) {
    email = value;
  }

  getPhone(value) {
    phone = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kBackgroundColor),
        title: Text(
          'Change Personal Details',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(kBackgroundColor))),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Text(
                          'First and Last Name: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 175,
                          child: TextField(
                            onChanged: getFirstAndLastName,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              hintText: '${LogInScreen.userName}',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(kBackgroundColor))),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: TextField(
                            onChanged: getAddress,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              hintText: '${LogInScreen.userAddress}',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(kBackgroundColor))),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Text(
                          'Phone:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          child: TextField(
                            onChanged: getPhone,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              hintText: '${LogInScreen.userPhoneNumber}',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(kBackgroundColor))),
                        color: Colors.white),
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Account Type:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (!isBuyer) {
                                _fireStore
                                    .collection('users')
                                    .doc(LogInScreen.userId)
                                    .update(
                                  {'isBuyer': true},
                                );
                              } else {
                                _fireStore
                                    .collection('users')
                                    .doc(LogInScreen.userId)
                                    .update(
                                  {'isBuyer': false},
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.black,
                                  content: !isBuyer
                                      ? Text('Changed account type to Buyer',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ))
                                      : Text(
                                          'Changed account type to Seller',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                ),
                              );
                              setState(() {
                                isBuyer = !isBuyer;
                                LogInScreen.userIsBuyer =
                                    !LogInScreen.userIsBuyer;
                              });
                            },
                            child: Text(
                              LogInScreen.userIsBuyer
                                  ? 'Switch to Selling'
                                  : 'Switch to Buying',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      minWidth: 120,
                      height: 45,
                      onPressed: () async {
                        await _fireStore
                            .collection('users')
                            .doc(LogInScreen.id)
                            .set({
                          'firstAndLastName': firstAndLastName,
                          'address': address,
                          'phoneNumber': phone,
                          'isBuyer': isBuyer,
                          'joinDate': getCurrentDate(),
                          'id': LogInScreen.userId,
                          'email': LogInScreen.userEmail,
                          'profilePicture': LogInScreen.userProfilePicture,
                          'backgroundPicture': LogInScreen.userBackgroundPicture
                        });
                        setState(() {
                          LogInScreen.userName = firstAndLastName;
                          LogInScreen.userAddress = address;
                          LogInScreen.userPhoneNumber = phone;
                        });
                      },
                      color: Color(kBackgroundColor),
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      minWidth: 120,
                      height: 45,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Color(kBackgroundColor),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
