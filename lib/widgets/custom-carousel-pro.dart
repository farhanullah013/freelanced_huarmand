import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarouselPro extends StatelessWidget {
  List getImages() {
    List images = [
      AssetImage('assets/images/1.png'),
      AssetImage('assets/images/2.png'),
    ];
    return images;
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(
      dotColor: Colors.blueGrey,
      dotIncreasedColor: Colors.grey,
      autoplayDuration: Duration(seconds: 8),
      borderRadius: false,
      boxFit: BoxFit.fill,
      autoplay: true,
      dotSize: 6.0,
      dotIncreaseSize: 2.0,
      dotBgColor: Colors.transparent,
      images: getImages(),
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );
  }
}
