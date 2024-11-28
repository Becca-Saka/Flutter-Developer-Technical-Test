import 'package:flutter/material.dart';

class AppProgressIndicator extends StatelessWidget {
  final double progress;

  const AppProgressIndicator({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: 20,
          child: LinearProgressIndicator(
            value: progress / 2,
            borderRadius: BorderRadius.circular(16),
            backgroundColor: Colors.black.withOpacity(0.6),
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.orange,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Loading...  ${(progress * 100).toInt()}%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
