import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:math_puzzle_getx/views/screens/play_screen.dart';

import 'views/screens/menu_screen.dart';

void main() {
  runApp(MathPuzzleApp());
}

class MathPuzzleApp extends StatelessWidget {
  const MathPuzzleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: PlayScreen(),
      home: MenuScreen(),
    );
  }
}
