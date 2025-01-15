import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzle_getx/controller/game_controller.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';
import 'package:math_puzzle_getx/views/screens/level_screen.dart';
import 'package:math_puzzle_getx/views/screens/play_screen.dart';

class MenuScreen extends StatelessWidget{
  const MenuScreen({super.key});

  @override
  // final GameController controller = Get.find<GameController>();
  Widget build(BuildContext context) {
    final GameController controller = Get.put(GameController());
    // final GameController controller = Get.find<GameController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(menuScreenBg),fit: BoxFit.fill,),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const SizedBox(
                height: 60,
            ),
            Center(child: Image.asset(mathPuzzlePath,height: 160,width: 290,)),
            const SizedBox(height: 130,),
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(PlayScreen(levelIndex: controller.maxLevel,));
                    },
                      child: Image.asset(playBtnMenu)),
                  const SizedBox(height: 30,),
                  GestureDetector(
                      onTap: () {
                        Get.to(const LevelScreen());
                      },
                      child: Image.asset(levelBtnMenu)),
                  const SizedBox(height: 30,),
                  Image.asset(buyproPath),
                ],
              ),
            ),
            const SizedBox(height: 160,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image.asset(shareButtonPath),
                ),
                Image.asset(privecyPolicy),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(gmailPath),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
