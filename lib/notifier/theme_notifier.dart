import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((_) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode>{
  ThemeNotifier():super(ThemeMode.dark){
    loadTheme();
  }

  void loadTheme() async{
    final pref = await SharedPreferences.getInstance();
    String? mode = pref.getString("thememode");

    state = mode == "dark" ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() async {
    String mode = "";
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      mode = "dark";
    } else {
      state = ThemeMode.light;
      mode = "light";
    }

    final pref  = await SharedPreferences.getInstance();
    pref.setString("thememode", mode);
  }
}