import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_puzzle_getx/controller/game_controller.dart';
import 'package:math_puzzle_getx/views/builders/scaffold_builder.dart';
import 'package:math_puzzle_getx/views/buttons/image_button.dart';
import 'package:math_puzzle_getx/views/screens/play_screen.dart';
import '../../utility/constants/string_constant.dart';

class LevelScreen extends StatelessWidget {
   const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController controller = Get.find<GameController>();
    return ScaffoldBuilder(
      body: Column(
        children: [
          const SizedBox(height: 25,),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 70,right: 70,top: 50,bottom: 15),
              child: Image.asset(
                selectPuzzlePath,
                // height: 100,
                // width: 450,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.status.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              itemBuilder: (context, index) =>GetX<GameController>(
                  builder: (controller) {
                    if(controller.status[index] == 'pending'){
                      return const ImageButton(
                        buttonColor: ButtonColor.blue,
                        image: lockPath,
                      );
                    }else if(controller.status[index]=='clear'){
                      return GestureDetector(
                        onTap: () => Get.to(PlayScreen(levelIndex: index,)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ImageButton(
                            buttonColor:  ButtonColor.blue,
                            text: '${index+1}',
                          ),
                          Image.asset(truePath),
                          ],
                          // child: ImageButton(
                          //   buttonColor:  ButtonColor.blue,
                          //   image: truePath,
                          // ),
                        ),
                      );
                    }else {
                      return GestureDetector(
                        onTap: () => Get.to(PlayScreen(levelIndex: index)),
                        child: ImageButton(
                          buttonColor: ButtonColor.blue,
                          text: '${index+1}',
                        ),
                        // child: Card(
                        //   color: Colors.transparent,
                        //    child: Center(child: Text('${index+1}')),
                        // ),
                      );
                    }
                  },
              ),
                // return GestureDetector(
                //   onTap: () {
                //     Get.to(PlayScreen(levelIndex: controller.currentQuestion,));
                //   },
                //   child: ImageButton(
                //     buttonColor: ButtonColor.blue,
                //     text: '${index + 1}',
                //   ),
                // );
              // },
            ),
          ),
        ],
      ),
    );
  }
}
