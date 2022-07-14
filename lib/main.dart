import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelanced_hunarmand/screens/add-product-screen.dart';
import 'package:freelanced_hunarmand/screens/change-personal-details-screen.dart';
import 'package:freelanced_hunarmand/screens/forgot-password-screen.dart';
import 'package:freelanced_hunarmand/screens/home-screen.dart';
import 'package:freelanced_hunarmand/screens/login-screen.dart';
import 'package:freelanced_hunarmand/screens/my-splash-screen.dart';
//import 'package:freelanced_hunarmand/screens/order-screen.dart';
//import 'package:freelanced_hunarmand/screens/order-summary-screen.dart';
import 'package:freelanced_hunarmand/screens/product-detail-screen.dart';
import 'package:freelanced_hunarmand/screens/clothes-screen.dart';
import 'package:freelanced_hunarmand/screens/profile-screen.dart';
import 'package:freelanced_hunarmand/screens/settings-screen.dart';
import 'package:freelanced_hunarmand/screens/shopping-cart-screen.dart';
import 'package:freelanced_hunarmand/screens/sign-up-screen.dart';
import 'package:freelanced_hunarmand/screens/shoes-screen.dart';
import 'package:freelanced_hunarmand/screens/vendor-home-screen.dart';
import 'package:freelanced_hunarmand/screens/wish-list-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MySplashScreen.id,
      routes: {
        MySplashScreen.id: (context) => SafeArea(child: MySplashScreen()),
        HomeScreen.id: (context) => SafeArea(child: HomeScreen()),
        LogInScreen.id: (context) => SafeArea(child: LogInScreen()),
        SignUpScreen.id: (context) => SafeArea(child: SignUpScreen()),
        ForgotPassword.id: (context) => SafeArea(child: ForgotPassword()),
        ShoppingCart.id: (context) => SafeArea(child: ShoppingCart()),
        WishList.id: (context) => SafeArea(child: WishList()),
        SettingsScreen.id: (context) => SafeArea(child: SettingsScreen()),
        //OrderScreen.id: (context) => SafeArea(child: OrderScreen()),
        ProfileScreen.id: (context) => SafeArea(child: ProfileScreen()),
        ClothesScreen.id: (context) =>
            SafeArea(child: ClothesScreen()),
        ChangePersonalDetails.id: (context) =>
            SafeArea(child: ChangePersonalDetails()),
        VendorHomeScreen.id: (context) => SafeArea(child: VendorHomeScreen()),
        AddProduct.id: (context) => SafeArea(child: AddProduct()),
        ProductDetailScreen.id: (context) =>
            SafeArea(child: ProductDetailScreen()),
        //OrderSummaryScreen.id: (context) =>
          //  SafeArea(child: OrderSummaryScreen()),
        ShoesScreen.id: (context) =>
            SafeArea(child: ShoesScreen()),
      },
    );
  }
}
