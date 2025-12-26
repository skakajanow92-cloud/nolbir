import 'package:dio/dio.dart';
import 'package:flutter_nolbir/apps/auth_screen.dart';
import 'package:flutter_nolbir/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

class Utils2 {
  // Görsel 2ab199db'deki sunucu IP adresin
  static const String _baseUrl = "http://192.168.1.104:3000/api";

  static final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  ));

  /// 1. Kayıt Ol (Register)
  static Future<Map<String, dynamic>> registerUser({
    required String username,
    required String email,
    required String password,
    String role = 'user',
  }) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        "username": username,
        "email": email,
        "password": password,
        "role": role,
      });
      return {"success": true, "data": response.data};
    } on DioException catch (e) {
      return {"success": false, "message": e.response?.data['message'] ?? "Bellige alma hatasy"};
    }
  }

  /// 2. Giriş Yap (Login)
  static Future<Map<String, dynamic>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/auth/login', data: {
        "email": email,
        "password": password,
      });

      // Giriş başarılıysa dönen Token'ı Dio'nun Header kısmına sabitliyoruz
      final String token = response.data['token'];
      _dio.options.headers["Authorization"] = "Bearer $token";

      return {
        "success": true, 
        "token": token,
        "user": response.data['user']
      };
    } on DioException catch (e) {
      // Görsel 2c43aa84'teki hata yönetim yapısına uygun
      return {
        "success": false, 
        "message": e.response?.data['message'] ?? "Giris basarnyksyz"
      };
    }
  }

  /// Genel Veri Çekme Fonksiyonu (GET)
  /// [endpoint]: İstek atılacak yol (Örn: '/finance/my-wallets' veya '/auth/profile')
  /// [queryParams]: Varsa filtreleme seçenekleri (Örn: {"currency": "USD"})
  static Future<Map<String, dynamic>> getData(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      return {
        "success": true,
        "data": response.data // Sunucudan gelen ham veri veya liste
      };
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data['message'] ?? "Maglumat alma hatasy: ${e.message}"
      };
    }
  }

  final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: authState ? '/dashboard' : '/auth',
    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(path: '/dashboard', builder: (context, state) => const Apps()),
    ],
    // Koruma: Giriş yapmamış kullanıcıyı her zaman Auth'a atar
    redirect: (context, state) {
      if (!authState && state.matchedLocation != '/auth') return '/auth';
      if (authState && state.matchedLocation == '/auth') return '/dashboard';
      return null;
    },
  );
});
}

// Kullanıcı oturum durumunu tutan provider
final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false) {
    _checkLoginStatus();
  }

  // Uygulama açıldığında hafızada kullanıcı var mı kontrol et
  void _checkLoginStatus() async {
    var box = await Hive.openBox('userBox');
    String? token = box.get('token');
    if (token != null) {
      state = true; // Oturum açık
    }
  }

  // Giriş/Kayıt başarılı olduğunda çağrılır
  void login(String token, Map userData) async {
    var box = await Hive.openBox('userBox');
    await box.put('token', token);
    await box.put('userData', userData);
    state = true;
  }

  void logout() async {
    var box = await Hive.openBox('userBox');
    await box.clear();
    state = false;
  }
}

