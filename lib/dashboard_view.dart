import 'package:flutter/material.dart';
import 'package:nounshunt/animated_logo.dart';
import 'package:nounshunt/shared/app_images.dart';

import 'shared/game_play_buttons.dart';
import 'shared/option_buttons.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImage(
                    path: AppImageData.avatar,
                    width: 50,
                    height: 50,
                  ),
                  Row(
                    children: [
                      AppImage(
                        path: AppImageData.dashCoin,
                        width: 24,
                        height: 24,
                        boxFit: BoxFit.contain,
                      ),
                      AppImage(
                        path: AppImageData.pencil,
                        width: 24,
                        height: 24,
                        boxFit: BoxFit.contain,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const AnimatedLogo(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ButtonOptions(
                    locked: false,
                    button: AppImageData.ranking,
                    title: 'RANKING',
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        GamePlayButtons(
                          shadowColor: const Color(0xFF0ad8a7),
                          gradientColors: const [
                            Color(0xFF3df184),
                            Color(0xFF19ed98),
                          ],
                          title: 'PLAY',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 16),
                        GamePlayButtons(
                          title: 'SPEED RUN',
                          shadowColor: const Color(0xFFb866fe),
                          gradientColors: const [
                            Color(0xFFd498ff),
                            Color(0xFFc885ff),
                          ],
                          onPressed: () {},
                        ),
                        const SizedBox(height: 16),
                        GamePlayButtons(
                          title: 'NOUNS HUNT',
                          locked: true,
                          shadowColor: const Color(0xFFc8c8cc),
                          gradientColors: const [
                            Color(0xFFe5e7f5),
                            Color(0xFFdddff3),
                          ],
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ButtonOptions(
                    locked: false,
                    button: AppImageData.scroll,
                    title: 'RULES',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOptions(
                    locked: false,
                    button: AppImageData.shop,
                    title: 'STORE',
                    onPressed: () {},
                  ),
                  ButtonOptions(
                    button: AppImageData.emoji,
                    title: 'CHARACTERS',
                    onPressed: () {},
                  ),
                  ButtonOptions(
                    button: AppImageData.trophy,
                    title: 'ACHIEVEMENTS',
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
