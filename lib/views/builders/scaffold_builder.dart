import 'package:flutter/material.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';

class ScaffoldBuilder extends StatelessWidget {
  const ScaffoldBuilder({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(defaultScaffoldPath),fit: BoxFit.fill),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: body,
        ),
      );
  }
}
