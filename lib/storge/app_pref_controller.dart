import 'package:shared_preferences/shared_preferences.dart';

class AppPrefController {

  static final AppPrefController _instance = AppPrefController._internal();
  late final SharedPreferences _sharedPreferences;

  factory AppPrefController(){
    return _instance;
  }

  AppPrefController._internal();

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setLanguage(String languageCode) async{
    return await _sharedPreferences.setString('language_code', languageCode);
  }

  String get languageCode {
    return _sharedPreferences.getString('language_code') ?? 'en';
  }
}