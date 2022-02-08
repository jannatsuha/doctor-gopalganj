import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomshapeTwo extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height);
    //path.relativeQuadraticBezierTo(10, 10, 10, 10);
    path.quadraticBezierTo(width/2, height-70, width, height);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}