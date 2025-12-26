import 'package:flutter/material.dart';
import 'package:flutter_nolbir/main.dart';
import 'package:flutter_nolbir/utils/utils2.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true; // Switch durumu
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final userController = TextEditingController();

  void _submit(WidgetRef ref) async {
    Map<String, dynamic> result;
    
    if (isLogin) {
      result = await Utils2.loginUser(
        email: emailController.text, 
        password: passController.text
      );
    } else {
      result = await Utils2.registerUser(
        username: userController.text,
        email: emailController.text,
        password: passController.text,
      );
    }

    if (result['success']) {
      // Başarılıysa Riverpod üzerinden durumu güncelle ve Hive'a kaydet
      ref.read(authProvider.notifier).login(result['token'], result['user']);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result['message'])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        return Column(
          children: [
            if (!isLogin) TextField(controller: userController, decoration: const InputDecoration(labelText: "Kullanıcı Adı")),
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "E-posta")),
            TextField(controller: passController, obscureText: true, decoration: const InputDecoration(labelText: "Şifre")),
            
            ElevatedButton(
              onPressed: () => _submit(ref),
              child: Text(isLogin ? "Giriş Yap" : "Kayıt Ol"),
            ),
            
            TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(isLogin ? "Hesabın yok mu? Kayıt Ol" : "Zaten üye misin? Giriş Yap"),
            )
          ],
        );
      }),
    );
  }
}

class Referans {
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