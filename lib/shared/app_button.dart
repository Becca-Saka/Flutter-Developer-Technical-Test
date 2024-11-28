import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Widget? child;
  final String? title;
  final double? width;
  final double? height;
  final double? elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final List<Color>? gradientColors;
  final VoidCallback? onPressed;
  final double? radius;
  const AppButton({
    super.key,
    this.child,
    this.width,
    this.height,
    this.title,
    this.onPressed,
    this.elevation,
    this.backgroundColor,
    this.gradientColors,
    this.shadowColor,
    this.radius,
  })  : assert(child != null || title != null),
        assert((gradientColors == null || backgroundColor == null),
            'Either backgroundColor or gradientColors must be provided, but not both.');

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.gradientColors != null
            ? LinearGradient(
                colors: widget.gradientColors!,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(widget.radius ?? 20),
        boxShadow: widget.gradientColors != null && widget.shadowColor != null
            ? [
                BoxShadow(
                  color: widget.shadowColor!,
                  // color: widget.gradientColors!.last,
                  blurRadius: 0,
                  spreadRadius: 0.1,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // elevation: widget.elevation,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          backgroundColor: widget.backgroundColor ??
              (widget.gradientColors != null
                  ? Colors.transparent
                  : Colors.white),
          shadowColor:
              widget.gradientColors != null ? Colors.transparent : null,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: widget.onPressed,
        child: Center(
          child: Builder(
            builder: (context) {
              if (widget.child != null) {
                return widget.child!;
              }
              return Text(
                widget.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
