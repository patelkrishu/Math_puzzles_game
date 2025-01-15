import 'package:flutter/material.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    required this.text,
    this.height = 46,
    this.width = 143,
    this.textColor = Colors.yellow});

  final String text;
  final double height;
  final double width;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(currentPuzzleBgPath),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              shadows: const [Shadow(
                offset: Offset(0, 3),
                color: Color(0xfff9ad3f),
                blurRadius: 10,
              )]
            ),
          ),
        ),
      ),
    );
  }
}
