
import 'package:math_puzzle_getx/storage/question_list_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  LocalStorageService._();
  late SharedPreferences sp;

  static Future<LocalStorageService> getInstance() async {
    LocalStorageService instance = LocalStorageService._();
    instance.sp = await SharedPreferences.getInstance();
    // instance.sp.clear();
    return instance;
  }

  void setLevelStatus({required String key,required String value}){
    sp.setString(key, value);
  }

  List<String> getLevelStatus(){
    List<String> status =[];
    for(int i =0;i<questionList.length;i++){
      String levelStatus =sp.getString('key$i')??'pending';
      status.add(levelStatus);
    }
    return status;
  }
  int getCompletedLevel(){
    return sp.getInt('level')??0;
  }
  void setNeweLevel({required String key,required int value}){
    sp.setInt(key, value);
  }
}