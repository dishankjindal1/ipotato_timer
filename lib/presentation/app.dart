import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipotato_timer/presentation/presentation_imports.dart';

class IPotatoTimerApp extends StatelessWidget {
  const IPotatoTimerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.splashPage,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
      );
}
