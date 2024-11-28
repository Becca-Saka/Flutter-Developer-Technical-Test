import 'package:flutter/material.dart';
import 'package:nounshunt/app/app_routes.dart';
import 'package:nounshunt/shared/app_video_player.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return AppVideoPlayer(
      videoUrl: 'assets/dash.mp4',
      onFinished: () {
        Navigator.pushNamed(
          context,
          AppRoutes.laucherView,
        );
      },
    );
  }
}
