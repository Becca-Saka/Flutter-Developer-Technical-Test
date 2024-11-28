import 'package:flutter/material.dart';
import 'package:nounshunt/ui/widgets/progress_cliper.dart';

class ClipProgressIndicator extends StatelessWidget {
  final double progress;
  final String progressText;
  final double height;
  final double width;
  const ClipProgressIndicator({
    super.key,
    required this.progress,
    required this.progressText,
    this.height = 30,
    this.width = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Positioned(
            right: -width / 2,
            top: 0,
            child: ProgressCliper(
              color: Colors.white,
              width: width + 6,
              height: height + 4,
            ),
          ),
          Positioned(
            right: -((width / 2) - 4),
            top: 1.5,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Stack(
                  children: [
                    ProgressCliper(
                      color: const Color(0xffe3e3e3),
                      width: width,
                      height: height,
                    ),
                    ProgressCliper(
                      color: Colors.orange,
                      width: width * progress,
                      height: height,
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    progressText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
