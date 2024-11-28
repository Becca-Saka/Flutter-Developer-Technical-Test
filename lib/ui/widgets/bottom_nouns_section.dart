import 'package:flutter/material.dart';
import 'package:nounshunt/shared/app_images.dart';

import 'unveil_animation.dart';

class BottomNounsSection extends StatelessWidget {
  const BottomNounsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 120,
          child: UnveilImageAnimation(
            child: Container(
              width: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImageData.nounsHuntLogo),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
