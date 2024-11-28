import 'package:flutter/material.dart';

class AppImageData {
  static const String _basePath = 'assets';

  static String get dexter => '$_basePath/superman_dexter.jpg';
  static String get nounsLogoGreen => '$_basePath/nouns_green.png';
  static String get nounsLogoYellow => '$_basePath/nouns_yellow.png';
  static String get nounsHuntLogo => '$_basePath/nounshunt_logo_main.png';
  static String get avatar => '$_basePath/6.png';
  static String get dashCoin => '$_basePath/dash_coins.png';
  static String get pencil => '$_basePath/nouns_pencil.png';
  static String get ranking => '$_basePath/ranking.png';
  static String get scroll => '$_basePath/scroll.png';
  static String get shop => '$_basePath/shop.png';
  static String get trophy => '$_basePath/trophy.png';
  static String get emoji => '$_basePath/emoji.png';
  static String get lock => '$_basePath/lock.png';
  static String get mainMenuBg => '$_basePath/main_menu_bg.png';
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
