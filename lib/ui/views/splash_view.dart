import 'package:flutter/material.dart';
import 'package:nounshunt/shared/app_images.dart';
import 'package:nounshunt/ui/views/dashboard_view.dart';
import 'package:nounshunt/ui/widgets/bottom_nouns_section.dart';
import 'package:nounshunt/ui/widgets/progress_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  bool fade = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    _slideAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -0.05).chain(
          CurveTween(curve: Curves.easeIn),
        ),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -0.1, end: 0.75).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.75, end: 0.7).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
        weight: 20,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7),
      ),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8),
      ),
    );

    _controller.addListener(() {
      if (_slideAnimation.value >= 0.7) {
        setState(() {
          fade = true;
        });

        _slideAnimation.removeListener(() {});
      }
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
    return fade
        ? const DashboardView()
        : AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Stack(
                  fit: StackFit.expand,
                  children: [
                    FadeTransition(
                      opacity: _opacityAnimation,
                      child: AppImage(
                        path: AppImageData.dexter,
                        boxFit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: _opacityAnimation.value,
                              child: Center(
                                child: Transform.translate(
                                  offset: Offset(
                                    0,
                                    -MediaQuery.of(context).size.height *
                                        _slideAnimation.value /
                                        1.11,
                                  ),
                                  child: const BottomNounsSection(),
                                ),
                              ),
                            ),
                            AnimatedSwitcher(
                              switchInCurve: Curves.easeIn,
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              duration: const Duration(seconds: 1),
                              child: _controller.value > 0.4
                                  ? AppProgressIndicator(
                                      progress: _controller.value,
                                    )
                                  : const Text(
                                      'Games and Software ©️ Dash Studios, Dash Studios and it\'s Logo are a trademark of Dash Studios.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }
}
