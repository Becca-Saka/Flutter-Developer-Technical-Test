import 'package:flutter/material.dart';
import 'package:nounshunt/shared/app_button.dart';
import 'package:nounshunt/shared/app_images.dart';

class ButtonOptions extends StatelessWidget {
  final String button;
  final String title;
  final bool locked;
  final VoidCallback? onPressed;
  const ButtonOptions({
    super.key,
    required this.button,
    required this.title,
    this.locked = true,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 80,
      width: 82,
      onPressed: onPressed,
      child: ButtonsOptionItem(
        locked: locked,
        button: button,
        title: title,
      ),
    );
  }
}

class ButtonsOptionItem extends StatelessWidget {
  final String button;
  final String title;
  final bool locked;
  const ButtonsOptionItem({
    super.key,
    required this.button,
    required this.title,
    this.locked = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              path: button,
              width: 45,
              height: 45,
              boxFit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 8,
              ),
            ),
          ],
        ),
        if (locked)
          Positioned(
            bottom: 0,
            right: -16,
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
