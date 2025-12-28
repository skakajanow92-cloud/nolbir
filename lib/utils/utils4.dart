import 'package:hive_flutter/hive_flutter.dart';

class Utils4 {
  // 1. Singleton Örneklerini Tutacak Map (Box adına göre ayrıştırır)
  static final Map<String, Utils4> _instances = {};
  
  final Box _box;
  final String boxName;

  // 2. Private Constructor
  Utils4._internal(this.boxName, this._box);

  // 3. Factory Constructor: Box ismine göre ilgili Singleton'ı döndürür
  // Not: Hive.openBox asenkron olduğu için bu factory'yi kullanmadan önce 
  // init() fonksiyonu ile box'ın açılmış olması gerekir.
  static Future<Utils4> getInstance(String boxName) async {
    if (!_instances.containsKey(boxName)) {
      // Eğer Box açık değilse açıyoruz
      final box = await Hive.openBox(boxName);
      _instances[boxName] = Utils4._internal(boxName, box);
    }
    return _instances[boxName]!;
  }

  // Hive'ı genel olarak başlatmak için (main.dart'ta bir kez çağrılır)
  static Future<void> initHive() async {
    await Hive.initFlutter();
  }

  // --- TEMEL CRUD İŞLEMLERİ ---

  // VERİ YAZMA
  Future<void> write(String key, dynamic value) async {
    await _box.put(key, value);
  }

  // VERİ OKUMA
  T? read<T>(String key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T?;
  }

  // VERİ SİLME
  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  // TÜM TABLOYU (BOX) TEMİZLE
  Future<void> clearAll() async {
    await _box.clear();
  }

  // ANAHTAR VAR MI?
  bool hasKey(String key) {
    return _box.containsKey(key);
  }

  // TÜM ANAHTARLARI GETİR
  List<dynamic> getAllKeys() {
    return _box.keys.toList();
  }
}