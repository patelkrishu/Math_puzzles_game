import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzle_getx/controller/game_controller.dart';
import 'package:math_puzzle_getx/storage/question_list_storage.dart';
import 'package:math_puzzle_getx/utility/constants/string_constant.dart';
import 'package:math_puzzle_getx/views/buttons/image_button.dart';
import 'package:math_puzzle_getx/views/buttons/level_button.dart';
import 'package:math_puzzle_getx/views/screens/winning_screen.dart';

import '../builders/scaffold_builder.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key, required this.levelIndex});

  final int levelIndex;

  // final PlayScreenController controller = PlayScreenController();
  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find<GameController>();
    Future.delayed(Duration.zero).then(
       (value) =>  controller.playingLevel.value = levelIndex,
    );

    // final GameController controller = Get.put(GameController());
    // int currentLevel = levelIndex ?? controller.currentQuestion;
    return ScaffoldBuilder(
      body: Column(
        children: [
          // row
          // skip,current puzzle,hint
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      // print('+++++++++skiipppp');
                      controller.skipQFun();
                    },
                    child: const ImageButton(
                      buttonColor: ButtonColor.orange,
                      image: skipPath,
                    ),
                  ),
                ),
                // Obx(
                //   () => Text(
                //     'Level ${controller.playingLevel.value + 1}',
                //     // text: 'Level ${currentLevel + 1}',
                //   ),
                // ),
                GetX<GameController>(builder: (controller) => LevelButton(
                    text: 'Level ${controller.playingLevel.value + 1}',
                    // text: 'Level ${currentLevel + 1}',
                    textColor: const Color(0xfff9ad3f),
                  ),),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: ImageButton(
                    buttonColor: ButtonColor.orange,
                    image: hintPath,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          //Question Board
          Container(
            height: 398,
            width: 336,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(questionBgPath),
              ),
            ),
            child: GetX<GameController>(builder: (controller) => Image.asset(
                questionList[controller.playingLevel.value + 1]
                ['questionPath']!,
                // QuestionList[controller.currentQuestion],
                height: 300,
                width: 197,
              ),),
          ),
          const SizedBox(
            height: 25,
          ),

          //digit grid
          Stack(
            children: [
              Image.asset(
                inputPath,
                height: 56,
                width: 360,
                fit: BoxFit.fill,
              ),
              Positioned(
                left: 20,
                top: 10,
                child: GetX<GameController>(
                  builder: (controller) => Text(
                    controller.display,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // child: Text('$number',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
          GestureDetector(
            onTap: () => controller.clearBtnFun(),
            child: Padding(
              padding: const EdgeInsets.only(left: 295),
              child: Container(
                height: 48,
                width: 58,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),

          GridView.builder(
            padding: const EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => controller.numberDisplayFun('${(index + 1) % 10}'),
                child: ImageButton(
                  buttonColor: ButtonColor.orange,
                  text: '${(index + 1) % 10}',
                  textColor: Colors.black,
                  fontSize: 30,
                ),
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          //submit
          GestureDetector(
            onTap: () {
              bool result = controller.onSubmit();
              if (result) {
                Get.to(const WinningScreen());
              }
            },
            child: const LevelButton(
              text: 'Submit',
              height: 65,
              width: 200,
              textColor: Color(0xfff9ad3f),
            ),
          ),
        ],
      ),
    );
  }
}
