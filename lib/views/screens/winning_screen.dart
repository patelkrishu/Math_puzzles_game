import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzle_getx/controller/game_controller.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';
import 'package:math_puzzle_getx/views/builders/scaffold_builder.dart';
import 'package:math_puzzle_getx/views/buttons/image_button.dart';
import 'package:math_puzzle_getx/views/screens/menu_screen.dart';

class WinningScreen extends StatelessWidget {
  const WinningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find<GameController>();
    return ScaffoldBuilder(
        body: Column(
          children: [
            const SizedBox(height: 35,),
            // level number
            SizedBox(
              height: 56,
              // width: 23,
              width: double.infinity,
              child: Center(
                child: Text('${controller.playingLevel.value}',
                // child: Text('${controller.currentQuestion}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            // level complete image
            Center(child: Image.asset(levelCompletePath,height: 50,width: 270,)),
            // trophy image
            const SizedBox(height: 10,),
            Image.asset(trophyPath,height: 300,width: 500,),
            const SizedBox(height: 5,),
            //winning buttons 3
            Column(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(continuePath,height: 80,width: 220,)),
                const SizedBox(height: 15,),
                GestureDetector(
                    onTap: () {
                      Get.to(const MenuScreen());
                    },
                    child: Image.asset(mainMenuPath,height: 80,width: 220,)),
                const SizedBox(height: 15,),
                Image.asset(buyproPath,height: 80,width: 220,),
              ],
            ),
            // share button
            const SizedBox(height: 30,),
            const ImageButton(
              height: 66,
              width: 61,
              buttonColor: ButtonColor.blue,
              image: sharePath,
            )
          ],

        ),
    );
  }
}
