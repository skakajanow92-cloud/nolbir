import 'package:shared_preferences/shared_preferences.dart';

class Utils1 {
  void prefIntInsert(String key, int num) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, num);
  }

  void prefDoubleInsert(String key, double dbl) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setDouble(key, dbl);
  }

  void prefStringInsert(String key, String str) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, str);
  }

  void prefBoolInsert(String key, bool boolean) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, boolean);
  }

  void prefListInsert(String key, List<String> lst) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(key, lst);
  }

  Future<String> prefStringGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  Future<int> prefIntGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? 0;
  }

  Future<double> prefDoubleGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getDouble(key) ?? 0.0;
  }

  Future<bool> prefBoolGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }

  Future<List<String>> prefListGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getStringList(key) ?? [];
  }

  dynamic functions({
    required int funcNumber,
    List<String> sparams=const[],
    List<int> iparams=const[],
    List<bool> bparams=const[],
    List<double> dparams=const[],
  }) {
    switch (funcNumber) {
      case 0:
        prefIntInsert(sparams.first, iparams.first);
      case 1:
        prefDoubleInsert(sparams.first, dparams.first);
      case 2:
        prefBoolInsert(sparams.first, bparams.first);
      case 3:
        prefStringInsert(sparams.first, sparams[1]);
      case 4:
        prefListInsert(sparams.first, sparams.sublist(1));
      default:
    }
  }
}
