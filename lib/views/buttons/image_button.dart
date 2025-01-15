

import 'package:flutter/material.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';

enum ButtonColor{blue,orange}

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
    this.buttonColor = ButtonColor.orange,
    this.text = '',
    this.image = '',
    this.height = 46,
    this.width = 44,
    this.textColor = Colors.white,
    this.fontSize = 24, this.index = 0,
  });

  final ButtonColor buttonColor;
  final String text;
  final image;
  final double height;
  final double width;
  final Color textColor;
  final double fontSize;
  final int index;


  @override
  Widget build(BuildContext context) {
    String buttonImg = buttonColor == ButtonColor.orange ? orangeButtonPath : blueButtonPath;

    Widget child;
    if (text.isNotEmpty){
      child = Center(child: Text(text,
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),);
    }
    else{
      child = Center(child: Image.asset(image),);
    }

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(buttonImg),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
