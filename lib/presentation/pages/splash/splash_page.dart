import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => const Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.white,
          child: Center(
            child: Text('Splash Page'),
          ),
        ),
      );
}
