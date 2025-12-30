import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class Utils6 {
  // Bu sınıfın dışarıdan örneklenmesini (instantiate) engelliyoruz.
  // Bütün metotlar statik olacağı için bir nesne oluşturmaya gerek yok.
  Utils6._();

  // Web platformu kontrolü
  static const bool isWeb = kIsWeb;

  // Mobil ve Masaüstü Platform Kontrolleri
  // kIsWeb kontrolü, web'de dart:io kaynaklı hataları önler.
  static bool get isAndroid => !isWeb && Platform.isAndroid;
  static bool get isIOS => !isWeb && Platform.isIOS;
  static bool get isWindows => !isWeb && Platform.isWindows;
  static bool get isLinux => !isWeb && Platform.isLinux;
  static bool get isMacOS => !isWeb && Platform.isMacOS;
  static bool get isFuchsia => !isWeb && Platform.isFuchsia;

  // Gruplandırılmış Platform Kontrolleri
  static bool get isDesktop => isWindows || isLinux || isMacOS;
  static bool get isMobile => isAndroid || isIOS;
}

/*
Kullanım Örneği:

if (Utils6.isMobile) {
  print("Bu kod bir mobil cihazda (Android veya iOS) çalışıyor.");
} else if (Utils6.isDesktop) {
  print("Bu kod bir masaüstü platformunda (Windows, Linux veya MacOS) çalışıyor.");
} else if (Utils6.isWeb) {
  print("Bu kod web'de çalışıyor.");
}
*/
