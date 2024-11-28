import 'dart:developer';

import 'package:flutter/material.dart';

class FadeInAnimationWidget extends StatefulWidget {
  final Widget child;
  final Tween<double> tween;
  const FadeInAnimationWidget({
    super.key,
    required this.child,
    required this.tween,
  });

  @override
  State<FadeInAnimationWidget> createState() => _FadeInAnimationWidgetState();
}

class _FadeInAnimationWidgetState extends State<FadeInAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _opacityAnimation = widget.tween.animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8),
      ),
    );
    _controller.addListener(() {
      log('Opacity: ${_opacityAnimation.value}');
      setState(() {});
    });
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
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacityAnimation,
          child: child,
        );
      },
    );
  }
}
