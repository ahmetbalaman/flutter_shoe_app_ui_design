// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
    double cornerSize;
    double diagonalHeight;
    final bool roundedBottom;
  AppClipper({
    required this.cornerSize,
    required this.diagonalHeight,
     this.roundedBottom=true,
  });


  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.moveTo(0, cornerSize * 1.5);
    path.lineTo(0, size.height - (roundedBottom ? cornerSize:0));
    if(roundedBottom)
      path.quadraticBezierTo(0, size.height, cornerSize, size.height);

    path.lineTo(size.width - (roundedBottom ? cornerSize:0), size.height);
    if(roundedBottom)
      path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - cornerSize);
        path.lineTo(size.width, diagonalHeight+cornerSize);
        path.quadraticBezierTo(size.width, diagonalHeight, size.width-cornerSize,diagonalHeight*.9 );
        path.lineTo(cornerSize*2, cornerSize);
        path.quadraticBezierTo(0, 0, 0, cornerSize*1.5);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
