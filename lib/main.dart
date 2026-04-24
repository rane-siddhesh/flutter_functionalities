import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_builder/dashboard.dart';

void main() {
  runApp(const MyApp());
}

final themeData = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff1f1f1f),
    secondary: Color(0xffffffff),
    error: Colors.red,
    surface: Color(0xff111111),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xff1f1f1f),
    onError: Colors.white,
    onSurface: Colors.white,
  ),
  textTheme: GoogleFonts.lexendTextTheme().copyWith(
    bodySmall: GoogleFonts.lexend(),
    bodyMedium: GoogleFonts.lexend(),
    bodyLarge: GoogleFonts.lexend(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      home: const Dashboard(),
    );
  }
}
