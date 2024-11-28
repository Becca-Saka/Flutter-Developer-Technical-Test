import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nounshunt/shared/app_images.dart';
import 'package:nounshunt/ui/views/animated_background.dart';
import 'package:nounshunt/ui/widgets/animated_logo.dart';
import 'package:nounshunt/ui/widgets/clip_progress_indicator.dart';
import 'package:nounshunt/ui/widgets/progress_cliper.dart';
import 'package:nounshunt/ui/widgets/reward_center.dart';

import '../../shared/game_play_buttons.dart';
import '../../shared/option_buttons.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfafaff),
      body: Stack(
        children: [
          const AnimatedBackground(),
          // AppImage(
          //   path: AppImageData.mainMenuBg,
          //   boxFit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Positioned(
                            top: 10,
                            child: ClipProgressIndicator(
                              height: 10,
                              width: 100,
                              progress: 0.2,
                              progressText: '0/5000',
                            ),
                          ),
                          Positioned(
                            top: 27,
                            left: 30,
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  const ProgressCliper(
                                    color: Colors.white,
                                    height: 15,
                                    width: 80,
                                  ),
                                  Center(
                                    child: Text(
                                      'gndirangu',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.spMin,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              AppImage(
                                path: AppImageData.avatar,
                                width: 50,
                                height: 50,
                              ),
                              Positioned(
                                bottom: -3,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF1cb9f8),
                                  ),
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const RewardCenter(),
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
        ],
      ),
    );
  }
}
