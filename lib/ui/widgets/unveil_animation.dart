import 'package:flutter/material.dart';

class UnveilImageAnimation extends StatefulWidget {
  final Widget child;
  const UnveilImageAnimation({
    super.key,
    required this.child,
  });

  @override
  State<UnveilImageAnimation> createState() => _UnveilImageAnimationState();
}

class _UnveilImageAnimationState extends State<UnveilImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double unveiledValue = 0.0;
  double totalClipValue = 100;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addListener(
        () {
          setState(() {
            unveiledValue = totalClipValue * _animation.value;
          });
        },
      );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return ClipRect(
          clipper: ScaleClipper(unveiledValue),
          child: child,
        );
      },
    );
  }
}

class ScaleClipper extends CustomClipper<Rect> {
  final double value;

  @override
  Rect getClip(Size size) {
    Rect rect = Rect.fromLTWH(0.0, 0.0 + value, size.width, size.height);
    return rect;
  }

  @override
  bool shouldReclip(ScaleClipper oldClipper) {
    return true;
  }

  ScaleClipper(this.value);
}
