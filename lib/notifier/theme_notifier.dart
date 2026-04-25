import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((_) {
  return ThemeNotifier(ThemeMode.dark);
});

class ThemeNotifier extends StateNotifier<ThemeMode>{
  ThemeNotifier(super.state);

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}