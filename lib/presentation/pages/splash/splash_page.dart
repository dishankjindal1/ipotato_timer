import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';
import 'package:ipotato_timer/utility/utility_imports.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Handle different screen sizes
    PixelScale.init(context);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      Navigator.of(context).pushReplacementNamed(
        AppRouter.homePage,
      );
      timer.cancel();
    });

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              MyAssets.potato,
              width: 60.ws(),
              fit: BoxFit.fitWidth,
            ),
            ...List<Widget>.generate(10, (_) => const AppSpacer()),
            Image.asset(
              MyAssets.logoText,
              width: 60.ws(),
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
