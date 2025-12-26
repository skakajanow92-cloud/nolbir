import 'package:flutter/material.dart';
import 'package:flutter_nolbir/utils/exports.dart';

class App002main extends StatefulWidget {
  const App002main({super.key});

  @override
  State<App002main> createState() => _App002mainState();
}

class _App002mainState extends State<App002main> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  void _handleRegister() async {
    setState(() => _isLoading = true);

    // Utils2 sınıfındaki fonksiyonu çağırıyoruz
    final result = await Utils2.registerUser(
      username: _userController.text,
      email: _emailController.text,
      password: _passController.text,
    );

    setState(() => _isLoading = false);

    if (result['success']) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kayıt Başarılı! Hoş geldin ${_userController.text}"),
          backgroundColor: Colors.green,
        ),
      );
      // Başarılıysa Login ekranına yönlendirilebilir
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Hata: ${result['message']}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Nolbir - Yeni Hesap Oluştur")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: "Kullanıcı Adı",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-posta",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passController,
                obscureText: true, // Şifreyi gizle
                decoration: InputDecoration(
                  labelText: "Şifre",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _handleRegister,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text("Kayıt Ol"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
