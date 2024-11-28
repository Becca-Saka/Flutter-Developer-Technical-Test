import 'dart:math';

import 'package:flutter/material.dart';

class ProgressCliper extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  const ProgressCliper({
    super.key,
    this.height = 30,
    this.width = 300,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        color: color,
        width: width,
        height: height,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final double _borderRadius; // percentage of the shortest side
  final double _angle;

  MyClipper({
    double? borderRadius,
    double? angle,
  })  : _borderRadius = borderRadius ?? .4,
        _angle = angle ?? degToRad(70).toDouble();

  @override
  Path getClip(Size size) {
    final borderRadius = _borderRadius * size.shortestSide;
    final dx = borderRadius * cos(_angle);
    final dy = borderRadius * sin(_angle);
    final dX = size.height / tan(_angle);
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width - dx, dy)
      ..lineTo(size.width - dX + dx, size.height - dy)
      ..quadraticBezierTo(size.width - dX, size.height,
          size.width - dX - borderRadius, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

num degToRad(num deg) => deg * (pi / 180.0);
