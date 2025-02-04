// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  final screenHeight;
  const HomePageBackground({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ClipPath(
      clipper: ButtomShapeClipper(),
      child: Container(
        height: screenHeight * .5,
        color: themeData.primaryColor,
      ),
    );
  }
}

class ButtomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = Offset(0, size.height * .85);
    Offset curveEndPoint = Offset(size.width, size.height * .85);
    path.lineTo(curveStartPoint.dx, curveStartPoint.dy);
    path.quadraticBezierTo(
        size.width / 2, size.height, curveEndPoint.dx, curveEndPoint.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
