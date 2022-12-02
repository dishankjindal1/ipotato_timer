import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.white,
          child: Center(
            child: Text('Home Page'),
          ),
        ),
      );
}
