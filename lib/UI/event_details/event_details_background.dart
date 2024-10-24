import 'package:amg_local_events/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsBackground extends StatelessWidget {
  const EventDetailsBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final event = Provider.of<Event>(context);
    return Align(
        alignment: Alignment.topCenter,
        child: ClipPath(
          clipper: ImageClipper(),
          child: Image.asset(
            event.imagePath,
            width: screenWidth * 2,
            height: screenHeight * .5,
            fit: BoxFit.cover,
            color: const Color(0x99000000),
            colorBlendMode: BlendMode.darken,
          ),
        ));
  }
}

class ImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset curveStartPoint = const Offset(0, 40);
    Offset curveEndPoint = Offset(size.width, size.height * .95);
    path.moveTo(curveStartPoint.dx, curveStartPoint.dy - 5);

    path.quadraticBezierTo(size.width * .2, size.height * .85,
        curveEndPoint.dx - 60, curveEndPoint.dy + 10);

    path.quadraticBezierTo(size.width * .99, size.height * .99,
        curveEndPoint.dx, curveEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
