import 'package:flutter/material.dart';
import 'package:nounshunt/shared/app_images.dart';

class RewardCenter extends StatelessWidget {
  const RewardCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RewardSection(
          image: AppImageData.dashCoin,
          reward: 50000,
          addColor: const Color(0xFFfaa252),
          backgroundColor: const Color(0xFFfdca9d),
        ),
        RewardSection(
          image: AppImageData.pencil,
          reward: 8,
          addColor: const Color(0xFF2cb9f1),
          backgroundColor: const Color(0xFF9edffb),
        ),
      ],
    );
  }
}

class RewardSection extends StatelessWidget {
  final int reward;
  final String image;
  final Color addColor;
  final Color backgroundColor;
  const RewardSection({
    super.key,
    required this.reward,
    required this.image,
    required this.addColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 4,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: 50),
                Text(
                  reward.toString(),
                  style: TextStyle(
                    color: addColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: addColor,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              top: -6,
              child: AppImage(
                path: image,
                width: 24,
                height: 24,
                boxFit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
