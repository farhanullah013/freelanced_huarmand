import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';
import 'package:freelanced_hunarmand/screens/change-personal-details-screen.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/custom-side-drawer.dart';
import 'package:freelanced_hunarmand/widgets/productDisplayContainer.dart';

import 'login-screen.dart';

class ProfileScreen extends StatefulWidget {
  static final String id = 'ProfileScreen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<Widget> getPersonalRecommendations(int start, int end) {
    List<ProductDisplayContainer> popularProducts = [];
    for (int i = start; i < end; i++) {
      popularProducts.add(ProductDisplayContainer(
        image: LogInScreen.productPhoto[i],
        price: LogInScreen.productPrice[i],
        name: LogInScreen.productName[i],
        details: LogInScreen.productDetails[i],
        productDiscountStatus: LogInScreen.productDiscountStatus[i],
        productRating: LogInScreen.productRating[i],
        productSize: LogInScreen.productSize[i],
        productQuantity: LogInScreen.productQuantity[i],
        isAddedToCart: LogInScreen.isAddedToCart[i],
        isAddedToWishList: LogInScreen.isAddedToWishList[i],
        productId: LogInScreen.productId[i],
      ));
    }
    return popularProducts;
  }

  bool showSpinner = false;
  getCurrentDate() {
    var now = new DateTime.now();
    String data = now.toString();
    List<String> dateTime = data.split(' ');
    String date = dateTime[0];
    return date;
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  final _fireStore = FirebaseFirestore.instance;
  bool isPictureAdded = false;
  Future<String> uploadPicture(File file, String location) async {
    String url;
    var storageRef = storage.ref().child('users/profile/${LogInScreen.userId}');
    var uploadTask = storageRef.putFile(file);

    await uploadTask.whenComplete(() async {
      url = await storageRef.getDownloadURL();
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              children: [
                Text(
                  'Failed to upload!',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
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
    return url;
  }

  _imgFromCamera(String location) async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      showSpinner = true;
    });
    String profileUrl = await uploadPicture(image, location);
    if (profileUrl != null) {
      await _fireStore.collection('users').doc(LogInScreen.userId).set({
        'profilePicture': profileUrl,
        'firstAndLastName': LogInScreen.userName,
        'address': LogInScreen.userAddress,
        'phoneNumber': LogInScreen.userPhoneNumber,
        'isBuyer': LogInScreen.userIsBuyer,
        'joinDate': getCurrentDate(),
        'id': LogInScreen.userId,
        'email': LogInScreen.userEmail,
        'backgroundPicture': LogInScreen.userBackgroundPicture
      });
      setState(() {
        if (location.contains('profile')) {
          LogInScreen.userProfilePicture = profileUrl;
          showSpinner = false;
        } else if (location.contains('background')) {
          LogInScreen.userBackgroundPicture = profileUrl;
          showSpinner = false;
        }
      });
    }
  }

  _imgFromGallery(String location) async {
    File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      showSpinner = true;
    });
    String profileUrl = await uploadPicture(image, location);
    if (profileUrl != null) {
      await _fireStore.collection('users').doc(LogInScreen.userId).set({
        'profilePicture': profileUrl,
        'firstAndLastName': LogInScreen.userName,
        'address': LogInScreen.userAddress,
        'phoneNumber': LogInScreen.userPhoneNumber,
        'isBuyer': LogInScreen.userIsBuyer,
        'joinDate': getCurrentDate(),
        'id': LogInScreen.userId,
        'email': LogInScreen.userEmail,
        'backgroundPicture': LogInScreen.userBackgroundPicture
      });
      setState(() {
        if (location.contains('profile')) {
          LogInScreen.userProfilePicture = profileUrl;
          showSpinner = false;
        } else if (location.contains('background')) {
          LogInScreen.userBackgroundPicture = profileUrl;
          showSpinner = false;
        }
      });
    }
  }

  void _showPicker(context, String location) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () async {
                        await _imgFromGallery(location);
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      await _imgFromCamera(location);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        drawer: CustomSideDrawer(),
        body: Material(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.grey,
                  child: Center(
                    child: LogInScreen.userBackgroundPicture
                            .contains('Edit Background Image')
                        ? GestureDetector(
                            onTap: () {
                              _showPicker(context, 'background');
                            },
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 45,
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              LogInScreen.userBackgroundPicture,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 145),
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 10),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.grey,
                                child: LogInScreen.userProfilePicture
                                        .contains('Add Image')
                                    ? GestureDetector(
                                        onTap: () {
                                          _showPicker(context, 'profile');
                                        },
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      )
                                    : SizedBox(),
                                backgroundImage: LogInScreen.userProfilePicture
                                        .contains('Add Image')
                                    ? AssetImage('assets/images')
                                    : NetworkImage(
                                        LogInScreen.userProfilePicture),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 75,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Text(
                                    LogInScreen.userName,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  child: Text(
                                    LogInScreen.userAddress,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 305),
                  width: double.maxFinite,
                  color: Colors.white,
                  height: 320,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal Details',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ChangePersonalDetails.id);
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.mail_rounded,
                              color: Colors.grey,
                              size: 28,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  LogInScreen.userEmail,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.grey,
                              size: 28,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  LogInScreen.userPhoneNumber,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 28,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Account Type',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  LogInScreen.userIsBuyer ? 'Buyer' : 'Seller',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.date_range_outlined,
                              color: Colors.grey,
                              size: 28,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Joined Date',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  LogInScreen.userJoinDate,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 620),
                  child: SizedBox(
                    height: 10,
                    child: Container(
                      color: Colors.grey[300],
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 630),
                  height: 400,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Recommendations',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: getPersonalRecommendations(0, 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
