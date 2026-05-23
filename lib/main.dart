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
  /*colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff1f1f1f),
    secondary: Color(0xffffffff),
    error: Colors.red,
    surface: Color(0xff111111),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xff1f1f1f),
    onError: Colors.white,
    onSurface: Colors.white,
  ),*/
  brightness: Brightness.dark,

  scaffoldBackgroundColor: Color(0xff111111) ,
  appBarTheme:AppBarThemeData(backgroundColor:  Color(0xff111111), toolbarTextStyle: TextStyle(color: Colors.white)),
  cardTheme: CardThemeData(color: Color(0xff1f1f1f)),
  switchTheme: SwitchThemeData(trackColor:  WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
      return Colors.purple; // Color when switch is ON
    }
    return Colors.purple.withOpacity(0.5); // Color when switch is OFF
  })),
  textTheme: GoogleFonts.lexendTextTheme().copyWith(
    bodySmall: GoogleFonts.lexend(color: Colors.white),
    bodyMedium: GoogleFonts.lexend(color: Colors.white),
    bodyLarge: GoogleFonts.lexend(color: Colors.white),
  ),
);

final themeData = ThemeData(
 /* colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.grey,
    secondary: Color(0xff111111),
    error: Colors.red,
    surface: Color(0xffffffff),
    onPrimary: Color(0xff111111),
    onSecondary: Color(0xffffffff),
    onError: Colors.black,
    onSurface: Colors.black,
  ),*/
  scaffoldBackgroundColor: Color(0xffffffff) ,
  appBarTheme:AppBarThemeData(backgroundColor:  Colors.white, toolbarTextStyle: TextStyle(color: Colors.black)),
  cardTheme: CardThemeData(color: Colors.grey),
    switchTheme: SwitchThemeData(trackColor:  WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
  if (states.contains(WidgetState.selected)) {
    return Colors.orange; // Color when switch is ON
  }
  return Colors.grey.withOpacity(0.5); // Color when switch is OFF
})),
  textTheme: GoogleFonts.lexendTextTheme().copyWith(
    bodySmall: GoogleFonts.lexend(color: Colors.black),
    bodyMedium: GoogleFonts.lexend(color: Colors.black),
    bodyLarge: GoogleFonts.lexend(color: Colors.black),
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
