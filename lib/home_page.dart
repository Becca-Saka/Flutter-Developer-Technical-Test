import 'package:flutter/material.dart';
import 'package:nounshunt/shared/app_images.dart';
import 'package:nounshunt/unveil_animation.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          AppImage(
            path: AppImageData.dexter,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 100,
                    child: UnveilImageAnimation(
                      child: Container(
                        width: 220,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/nouns_green.png"),
                            fit: BoxFit.contain,
                          ),
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
  }
}
