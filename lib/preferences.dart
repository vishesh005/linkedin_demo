import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static SharedPreferences _preference;

   static Future<void> awake()async{
        if(_preference == null) {
          _preference = await SharedPreferences.getInstance();
        }
  }

  static bool containKey(String key) => _preference.containsKey(key);

  static Future<bool> clearData() async => await _preference.clear();

  static Future<bool> saveString(String key,String value) async{
       return _preference.setString(key, value);
  }
  static String getString(String key,{String defaultValue}) {
    try {
      final value = _preference.getString(key);
      return value?.isEmpty ?? defaultValue;
    }catch(e){
      return defaultValue;
    }
  }
  static Future<bool> saveInt(String key,int value){
    return _preference.setInt(key, value);
  }
 static int getInt(String key,{int defaultValue}){
    try {
      return  _preference.getInt(key) ?? defaultValue;
    }catch(e){
      return defaultValue;
    }
  }
  static Future<void> saveBoolean(String key,bool value){
    return _preference.setBool(key, value);
  }
  static bool getBoolean(String key,{bool defaultValue}) {
    try {
      return _preference.getBool(key) ?? defaultValue;
    }catch(e){
      return defaultValue;
    }
  }
  static Future<bool> saveListOfStrings(String key,List<String> value){
    return _preference.setStringList(key, value);
  }
  static List<String> getListOfStrings(String key,{List<String> defaultValue}){
    try {
     return _preference.getStringList(key) ?? defaultValue;
    }catch(e){
      return defaultValue;
    }
  }

}