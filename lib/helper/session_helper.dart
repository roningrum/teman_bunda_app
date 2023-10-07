import 'package:shared_preferences/shared_preferences.dart';

class SessionHelper{


  Future<void> saveStatedPolicy() async{
    final pref = await SharedPreferences.getInstance();
    pref.setBool("accept", true);
  }

  Future<bool?> isAccept() async{
    final pref = await SharedPreferences.getInstance();
    return pref.getBool("accept");
  }
}