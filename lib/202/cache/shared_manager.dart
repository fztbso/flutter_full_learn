
import 'package:flutter_full_learn/202/cache/shared_not_initialized.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys {
  counter, users
}


class SharedManager {
  SharedPreferences? preferences;

  SharedManager(){
    init();
  }

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if(preferences == null){
      throw SharedNotInitializedException();
    }
  }

  Future<void> saveString(SharedKeys key, String value) async{
    // final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async{
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStrings(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    // final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async{
    // final prefs = await SharedPreferences.getInstance();
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}