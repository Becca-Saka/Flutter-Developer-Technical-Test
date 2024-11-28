import 'package:flutter/material.dart';

import 'app_button.dart';
import 'app_images.dart';

class GamePlayButtons extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final List<Color>? gradientColors;
  final Color? shadowColor;
  final bool locked;
  const GamePlayButtons({
    super.key,
    required this.title,
    required this.onPressed,
    this.gradientColors,
    this.shadowColor,
    this.locked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppButton(
          height: 60,
          width: double.infinity,
          shadowColor: shadowColor,
          gradientColors: gradientColors,
          title: title,
          onPressed: onPressed,
        ),
        if (locked)
          Positioned(
            bottom: -6,
            right: -4,
            child: AppImage(
              path: AppImageData.lock,
              width: 20,
              height: 20,
              boxFit: BoxFit.contain,
            ),
          ),
      ],
    );
  }
}
