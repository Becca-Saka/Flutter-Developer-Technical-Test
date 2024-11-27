import 'package:flutter/material.dart';

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
          height: 100,
          child: UnveilImageAnimation(
            child: Container(
              width: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/nouns_green.png"),
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
