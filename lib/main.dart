import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layout_builder/dashboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:layout_builder/notifier/theme_notifier.dart';
import 'package:layout_builder/route_config.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

final darkthemeData = ThemeData(
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

final themeData = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.grey,
    secondary: Color(0xff111111),
    error: Colors.red,
    surface: Color(0xffffffff),
    onPrimary: Color(0xff111111),
    onSecondary: Color(0xffffffff),
    onError: Colors.black,
    onSurface: Colors.black,
  ),
  textTheme: GoogleFonts.lexendTextTheme().copyWith(
    bodySmall: GoogleFonts.lexend(),
    bodyMedium: GoogleFonts.lexend(),
    bodyLarge: GoogleFonts.lexend(),
  ),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      darkTheme: darkthemeData,
      theme: themeData,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
