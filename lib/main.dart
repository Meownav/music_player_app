import 'package:flutter/material.dart';
import 'package:music_player_app/pages/page_provider.dart';
import 'package:music_player_app/themes/light_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: PageProvider(),
      ),
    );
  }
}
