import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';

import 'constants/sizes.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TikTok Clone',
        theme: ThemeData(
          primaryColor: const Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        home: const SettingsScreen());
  }
}
