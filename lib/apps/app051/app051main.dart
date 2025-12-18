import 'package:flutter/material.dart';
class App051main extends StatefulWidget {
  const App051main({super.key});

  @override
  State<App051main> createState() => _App051mainState();
}

class _App051mainState extends State<App051main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '01.tech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(),
    );
  }
}

