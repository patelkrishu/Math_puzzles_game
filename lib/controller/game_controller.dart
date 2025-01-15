// class PlayScreenController{
//   int number=0;
//   // List<int> number =[];
//   // void addnum(int num){
//   //   number.add(num);
//   // }
//
// // }
//
// import 'package:math_puzzle/views/buttons/image_button.dart';
// import 'package:math_puzzle/views/buttons/level_button.dart';
//
// class PlayScreenController{
//   var display ='';
//
//   void buttonTap(int index){
//     display += ImageButton(index: index,).text;
//   }
//
// }

import 'package:get/get.dart';
import 'package:math_puzzle_getx/storage/question_list_storage.dart';

import '../services/local_storage_service.dart';

class GameController extends GetxController {
  final RxInt _maxLevel = 0.obs;
  final RxInt playingLevel = 0.obs;
  final RxString _display = ''.obs;
  final RxList<String> _status =
      List.filled(questionList.length, 'pending').obs;

  int get maxLevel => _maxLevel.value;
  LocalStorageService? service;

  // final List<QuestionListModel> _questionlist =[];
  //
  // List<QuestionListModel> get questionlist => _questionlist;

  @override
  void onInit() {
    // _fetchCurrentQuestion();
    LocalStorageService.getInstance().then(
      (value) {
        service = value;
        _status.value = value.getLevelStatus();
        _maxLevel.value = value.getCompletedLevel();

        if (_status[playingLevel.value] == 'pending') {
          _status[playingLevel.value] = 'skip';
          service?.setLevelStatus(
              key: 'key${playingLevel.value}', value: 'skip');
        }
      },
    );
    super.onInit();
  }

  String get display => _display.value;

  List<String> get status => _status;

  int get level => playingLevel.value;

  // late SharedPreferences sp;

  // void _fetchQuestion(){
  //   for(var question in QuestionList){
  //     QuestionListModel model = QuestionListModel.fromJson(question);
  //     _questionlist.add(model);
  //   }
  // }

  // Future<void> _fetchCurrentQuestion() async {
  //   sp = await SharedPreferences.getInstance();
  //   // sp.clear();
  //   _currentQuestion.value =sp.getInt('currentQuestion')?? 0;
  // }

  // void setNewLevel(){
  //   sp.setInt('currentQuestion', _currentQuestion.value);
  // }

  void skipQFun() {
    if (status[level] == 'pending') {
      status[level] = 'skip';
      service?.setLevelStatus(key: 'key${level}', value: 'skip');
      _maxLevel.value = level;
      service?.setNeweLevel(key: 'level', value: _maxLevel.value);
    }
    playingLevel.value++;
    // status[currentQuestion] ='skip';
    // _currentQuestion.value =((_currentQuestion.value+1) % questionList.length);
  }

  void clearBtnFun() {
    if (_display.value.isNotEmpty) {
      _display.value = _display.value.substring(0, _display.value.length - 1);
    }
  }

  void numberDisplayFun(String digit) {
    if (_display.value.length < 10) {
      _display.value = _display.value + digit;
    }
  }

  bool onSubmit() {
    if (display == questionList[level]['ans']) {
      status[playingLevel.value] = 'clear';
      service?.setLevelStatus(key: 'key${playingLevel.value}', value: 'clear');
      if (status[playingLevel.value + 1] == 'pending') {
        service?.setLevelStatus(
            key: 'key${playingLevel.value + 1}', value: 'skip');
        status[playingLevel.value + 1] = 'skip';
      }
      playingLevel.value++;
      if (_maxLevel <= playingLevel.value) {
        _maxLevel.value = playingLevel.value;
        service?.setNeweLevel(key: 'level', value: _maxLevel.value);
      }
      _display.value = '';
      return true;
    }
    return false;
    // if(display == questionList[currentQuestion]['ans']){
    //   print(status);
    //   status[currentQuestion] ='clear';
    //   print(status);
    //   _currentQue/stion.value++;
    //   _display.value='';
    //   setNewLevel();
    //   return true;
    // }
    // return false;
  }
}

// '${_currentQuestion.value}'
