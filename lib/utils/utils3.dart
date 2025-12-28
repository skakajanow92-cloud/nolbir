import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class Utils3 {
  static final Map<String, Utils3> _instances = {};
  final Dio _dio;
  final String baseUrl;

  // Private Constructor
  Utils3._internal(this.baseUrl)
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    _setupInterceptors();
  }

  // Factory Constructor (URL'ye göre Singleton örneği döndürür)
  factory Utils3({required String url}) {
    if (!_instances.containsKey(url)) {
      _instances[url] = Utils3._internal(url);
    }
    return _instances[url]!;
  }

  // Interceptor Yapılandırması
  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Buraya Token ekleme mantığı gelebilir
          print("🚀 İstek: ${options.method} -> ${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException e, handler) {
          // Hata yakalama ve Türkçeleştirme
          String errorMessage = _handleError(e);
          print("❌ Hata: $errorMessage");
          return handler.next(e);
        },
      ),
    );
  }

  // Hata Yönetimi Katmanı
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Sunucuya bağlanılamadı (Zaman aşımı).";
      case DioExceptionType.receiveTimeout:
        return "Sunucudan yanıt alınamadı.";
      case DioExceptionType.badResponse:
        return "Sunucu hatası: ${error.response?.statusCode}";
      case DioExceptionType.cancel:
        return "İstek iptal edildi.";
      case DioExceptionType.connectionError:
        return "İnternet bağlantınızı kontrol edin.";
      default:
        return "Beklenmedik bir hata oluştu.";
    }
  }

  // --- CRUD OPERASYONLARI ---

  Future<Response> get(String endpoint, {Map<String, dynamic>? query}) async =>
      await _dio.get(endpoint, queryParameters: query);

  Future<Response> post(String endpoint, {dynamic data}) async =>
      await _dio.post(endpoint, data: data);

  Future<Response> put(String endpoint, {dynamic data}) async =>
      await _dio.put(endpoint, data: data);

  Future<Response> delete(String endpoint) async => await _dio.delete(endpoint);

  // --- DOSYA YÜKLEME (UPLOAD) ---
  Future<Response> upload(String endpoint, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    return await _dio.post(endpoint, data: formData);
  }

  // --- DOSYA İNDİRME (DOWNLOAD) ---
  Future<String?> downloadFile(String url, String fileName) async {
    try {
      // Cihazın döküman klasörünü alıyoruz
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String savePath = "${appDocDir.path}/$fileName";

      await _dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            print(
              "İndiriliyor: %${(received / total * 100).toStringAsFixed(0)}",
            );
          }
        },
      );
      return savePath; // İndirilen dosyanın yolunu döndürür
    } catch (e) {
      print("İndirme hatası: $e");
      return null;
    }
  }
}
