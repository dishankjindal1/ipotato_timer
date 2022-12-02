import 'package:flutter/material.dart';
import 'package:ipotato_timer/presentation/router/router_config.dart';

class IPotatoTimerApp extends StatelessWidget {
  const IPotatoTimerApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splashPage,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
}
