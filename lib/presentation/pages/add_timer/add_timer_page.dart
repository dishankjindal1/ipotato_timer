import 'package:flutter/material.dart';

class AddTimerPage extends StatelessWidget {
  const AddTimerPage({super.key});

  @override
  Widget build(BuildContext context) => const Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.white,
          child: Center(
            child: Text('Add Timer Page'),
          ),
        ),
      );
}
