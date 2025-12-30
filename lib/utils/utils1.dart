import 'package:shared_preferences/shared_preferences.dart';

class Utils1 {
  // Singleton Yapısı
  Utils1._internal();
  static final Utils1 _instance = Utils1._internal();
  factory Utils1() => _instance;

  Future<void> prefIntInsert(String key, int num) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt(key, num);
  }

  Future<void> prefDoubleInsert(String key, double dbl) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setDouble(key, dbl);
  }

  Future<void> prefStringInsert(String key, String str) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, str);
  }

  Future<void> prefBoolInsert(String key, bool boolean) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(key, boolean);
  }

  Future<void> prefListInsert(String key, List<String> lst) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setStringList(key, lst);
  }

  Future<String> prefStringGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? '';
  }

  Future<int> prefIntGet(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? 2;
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

  Future<void> functions({
    required int funcNumber,
    List<String> sparams = const [],
    List<int> iparams = const [],
    List<bool> bparams = const [],
    List<double> dparams = const [],
  }) async {
    switch (funcNumber) {
      case 0:
        await prefIntInsert(sparams.first, iparams.first);
        break;
      case 1:
        await prefDoubleInsert(sparams.first, dparams.first);
        break;
      case 2:
        await prefBoolInsert(sparams.first, bparams.first);
        break;
      case 3:
        await prefStringInsert(sparams.first, sparams[1]);
        break;
      case 4:
        await prefListInsert(sparams.first, sparams.sublist(1));
        break;
      default:
        break;
    }
  }
}
