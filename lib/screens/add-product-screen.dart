import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/utilities/constants.dart';
import 'package:freelanced_hunarmand/widgets/custom-side-drawer.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'login-screen.dart';

class AddProduct extends StatefulWidget {
  static final String id = 'AddProduct';
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  bool isShoesSelected = false;
  bool isClothesSelected = true;
  bool isMaleSelected = false;
  bool isFemaleSelected = true;
  bool showSpinner = false;
  File image;
  String productName;
  String productDetails;
  String productManufacturer;
  String productSize;
  String productPrice;
  String productQuantity;
  getProductName(value) {
    productName = value;
  }

  getProductDetails(value) {
    productDetails = value;
  }

  getProductManufacturer(value) {
    productManufacturer = value;
  }

  getProductSize(value) {
    productSize = value;
  }

  getProductPrice(value) {
    productPrice = value;
  }

  getProductQuantity(value) {
    productQuantity = value;
  }

  String refId;
  getId() {
    refId = _fireStore.collection('receipt').doc().id;
  }

  final _fireStore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<String> uploadPicture(File file) async {
    String url;
    var storageRef = storage.ref().child('product/image/$refId');
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

  _imgFromCamera() async {
    File _image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = _image;
    });
  }

  _imgFromGallery() async {
    File _image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image = _image;
    });
  }

  void _showPicker(context) {
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
                        await _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () async {
                      await _imgFromCamera();
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
  void initState() {
    getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(kBackgroundColor),
          title: Text('Add Product'),
        ),
        body: Material(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Category :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      bottomLeft: Radius.circular(7),
                                    ),
                                  ),
                                  minWidth: 70,
                                  height: 40,
                                  color: isShoesSelected
                                      ? Color(kBackgroundColor)
                                      : Colors.grey[200],
                                  onPressed: () {
                                    setState(() {
                                      isClothesSelected = false;
                                      isShoesSelected = true;
                                    });
                                  },
                                  child: Text(
                                    'Shoes',
                                    style: TextStyle(
                                      color: isShoesSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7),
                                      bottomRight: Radius.circular(7),
                                    ),
                                  ),
                                  minWidth: 70,
                                  height: 40,
                                  color: isClothesSelected
                                      ? Color(kBackgroundColor)
                                      : Colors.grey[200],
                                  onPressed: () {
                                    setState(() {
                                      isClothesSelected = true;
                                      isShoesSelected = false;
                                    });
                                  },
                                  child: Text(
                                    'Clothes',
                                    style: TextStyle(
                                      color: isClothesSelected
                                          ? Colors.white
                                          : Colors.deepOrange,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
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
                              'Gender :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(7),
                                      bottomLeft: Radius.circular(7),
                                    ),
                                  ),
                                  minWidth: 70,
                                  height: 40,
                                  color: isMaleSelected
                                      ? Color(kBackgroundColor)
                                      : Colors.grey[200],
                                  onPressed: () {
                                    setState(() {
                                      isMaleSelected = true;
                                      isFemaleSelected = false;
                                    });
                                  },
                                  child: Text(
                                    'Male',
                                    style: TextStyle(
                                      color: isMaleSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(7),
                                      bottomRight: Radius.circular(7),
                                    ),
                                  ),
                                  minWidth: 70,
                                  height: 40,
                                  color: isFemaleSelected
                                      ? Color(kBackgroundColor)
                                      : Colors.grey[200],
                                  onPressed: () {
                                    setState(() {
                                      isFemaleSelected = true;
                                      isMaleSelected = false;
                                    });
                                  },
                                  child: Text(
                                    'Female',
                                    style: TextStyle(
                                      color: isFemaleSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
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
                              'Enter Product Name :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 185,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Name of your product',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                              'Enter Product Details :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 180,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductDetails,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Details of your product',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                              'Enter Product Manufacturer :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 135,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductManufacturer,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Manufacturer of your product',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                              'Enter Product Size :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 200,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductSize,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Like small, medium or large',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                              'Enter Product Price :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 190,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductPrice,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Price of your product',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                              'Enter Product Quantity :',
                              style: TextStyle(fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 170,
                              child: Material(
                                color: Colors.transparent,
                                child: TextField(
                                  onChanged: getProductQuantity,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    fillColor: Colors.transparent,
                                    filled: true,
                                    hintText: 'Quantity of your product',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 13),
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
                      ),
                      MaterialButton(
                        height: 40,
                        color: Colors.grey[200],
                        onPressed: () async {
                          _showPicker(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera,
                              size: 28,
                              color: Colors.black,
                            ),
                            Text(
                              'Upload Product Picture',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                                if (productName == null ||
                                    productDetails == null ||
                                    productPrice == null ||
                                    productSize == null ||
                                    productQuantity == null ||
                                    image == null) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Column(
                                            children: [
                                              Text(
                                                'Please Fill all Fields',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 80),
                                              child: MaterialButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                  'Cancel',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            ),
                                          ],
                                          elevation: 10,
                                        );
                                      });
                                } else {
                                  setState(() {
                                    showSpinner = true;
                                  });
                                  String productPhoto =
                                      await uploadPicture(image);
                                  await _fireStore
                                      .collection('products')
                                      .doc(refId)
                                      .set({
                                    'category': isShoesSelected
                                        ? 'shoes'
                                        : 'clothes',
                                    'gender':
                                        isMaleSelected ? 'male' : 'female',
                                    'productName': productName,
                                    'productDetails': productDetails,
                                    'productManufacturer': productManufacturer,
                                    'productSize': productSize,
                                    'productPrice': productPrice,
                                    'productQuantity': productQuantity,
                                    'productPhoto': productPhoto,
                                    'productDiscountStatus': false,
                                    'productRating': '5.0',
                                    'id': refId,
                                    'isAddedToCart': false,
                                    'isAddedToWishList': false
                                  });
                                  setState(() {
                                    LogInScreen.productCategory.add(
                                        isShoesSelected
                                            ? 'shoes'
                                            : 'Clothes');
                                    LogInScreen.productGender.add(
                                        isMaleSelected ? 'male' : 'female');
                                    LogInScreen.productName.add(productName);
                                    LogInScreen.productDetails
                                        .add(productDetails);
                                    LogInScreen.productManufacturer
                                        .add(productManufacturer);
                                    LogInScreen.productSize.add(productSize);
                                    LogInScreen.productPrice.add(productPrice);
                                    LogInScreen.productQuantity
                                        .add(productQuantity);
                                    LogInScreen.productPhoto.add(productPhoto);
                                    LogInScreen.productDiscountStatus
                                        .add(false);
                                    LogInScreen.productRating.add('5.0');
                                    LogInScreen.productId.add(refId);
                                    LogInScreen.isAddedToCart.add(false);
                                    LogInScreen.isAddedToWishList.add(false);
                                  });
                                  setState(() {
                                    showSpinner = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Colors.white,
                                          title: Column(
                                            children: [
                                              Text(
                                                'Your Product has been added successfully',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                children: [
                                                  MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                    ),
                                                    minWidth: 90,
                                                    height: 40,
                                                    color:
                                                        Color(kBackgroundColor),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .popAndPushNamed(
                                                              AddProduct.id);
                                                    },
                                                    elevation: 10,
                                                    child: Text(
                                                      'Add More',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  MaterialButton(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  7.0)),
                                                    ),
                                                    minWidth: 90,
                                                    height: 40,
                                                    color:
                                                        Color(kBackgroundColor),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    elevation: 10,
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          elevation: 10,
                                        );
                                      });
                                }
                              },
                              color: Color(kBackgroundColor),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
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
    );
  }
}
