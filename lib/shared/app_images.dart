import 'package:flutter/material.dart';

class AppImageData {
  static const String _basePath = 'assets';

  static String get dexter => '$_basePath/superman_dexter.jpg';
  static String get nounsLogoGreen => '$_basePath/nouns_green.png';
  static String get nounsLogoYellow => '$_basePath/nouns_yellow.png';
}

class AppImage extends StatelessWidget {
  final String path;
  final BoxFit? boxFit;
  final double? width, height;
  const AppImage({
    super.key,
    required this.path,
    this.boxFit,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        path,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }
}
