package com.example.flutter_nolbir
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(), SensorEventListener {
    private val METHOD_CHANNEL = "com.app.native/methods"
    private val SENSOR_CHANNEL = "com.app.native/sensors"
    private var eventSink: EventChannel.EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // 1. Method Channel Tanımı (Kütüphaneye veri gönderme)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "processWithLibrary") {
                val libName = call.argument<String>("library")
                val data = call.argument<Map<String, Any>>("data")
                
                // Burada dış kütüphane fonksiyonunuzu çağırın
                // Örn: CustomLibrary.start(data)
                
                result.success(mapOf("status" to "success", "processedBy" to libName))
            } else {
                result.notImplemented()
            }
        }

        // 2. Event Channel Tanımı (Sensör verisi akışı)
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, SENSOR_CHANNEL).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    eventSink = events
                    // Sensör dinlemeyi başlat (İvmeölçer vb.)
                }

                override fun onCancel(arguments: Any?) {
                    eventSink = null
                }
            }
        )
    }

    override fun onSensorChanged(event: SensorEvent?) {
        // Sensör verisi değiştikçe Flutter tarafına "sink" üzerinden gönderilir
        val values = event?.values?.toList()
        eventSink?.success(values)
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {}
}
