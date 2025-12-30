import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Utils2 {
  // Singleton Yapısı
  Utils2._internal();
  static final Utils2 _instance = Utils2._internal();
  factory Utils2() => _instance;

  // 1. Method Channel: Native tarafa komut göndermek ve cevap almak için
  static const MethodChannel _methodChannel = MethodChannel(
    'com.app.native/methods',
  );

  // 2. Event Channel: Native taraftan sürekli akan veriyi (Sensörler vb.) dinlemek için
  static const EventChannel _sensorChannel = EventChannel(
    'com.app.native/sensors',
  );

  // --- 1. KOMUT GÖNDERME VE VERİ AKTARIMI (Method Channel) ---

  // Karmaşık verileri (Map) dış kütüphanelere/SDK'lara gönderme
  Future<Map<String, dynamic>?> sendToLibrary(
    String libName,
    Map<String, dynamic> payload,
  ) async {
    try {
      final Map<dynamic, dynamic>? result = await _methodChannel.invokeMethod(
        'processWithLibrary',
        {'library': libName, 'data': payload},
      );
      return result?.cast<String, dynamic>();
    } on PlatformException catch (e) {
      debugPrint("Native Kütüphane Hatası: ${e.message}");
      return null;
    }
  }

  // --- 2. SENSÖR VERİLERİNİ DİNLEME (Event Channel) ---

  // Sensör verilerini bir Stream olarak döndürür
  Stream<dynamic> get sensorStream {
    return _sensorChannel.receiveBroadcastStream();
  }

  // Örnek: Batarya Seviyesini Sürekli Dinle
  Stream<int> get batteryStream {
    return _sensorChannel
        .receiveBroadcastStream('battery')
        .map((event) => event as int);
  }
}

/*

class SensorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: NativeService().sensorStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text("Sensör Verisi: ${snapshot.data}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Bir kütüphaneye veri gönder
          var res = await NativeService().sendToLibrary("PaymentSDK", {"amount": 100});
          print("Cevap: $res");
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

*/
