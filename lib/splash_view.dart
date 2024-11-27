import 'package:flutter/material.dart';
import 'package:nounshunt/bottom_nouns_section.dart';
import 'package:nounshunt/shared/app_images.dart';

import 'dashboard_view.dart';

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

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 0.0, end: 0.75).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeIn),
      ),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8),
      ),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const DashboardView()),
        );
      }
    });
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Opacity(
                        opacity: _opacityAnimation.value,
                        child: Center(
                          child: Hero(
                            tag: 'logo',
                            createRectTween: (begin, end) {
                              return MaterialRectArcTween(
                                  begin: begin, end: end);
                            },
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
                      ),
                      const Text(
                        'Games and Software ©️ Dash Studios, Dash Studios and it\'s Logo are a trademark of Dash Studios.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
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
