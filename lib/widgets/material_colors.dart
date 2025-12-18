import 'package:flutter/material.dart';

class MaterialColors extends StatelessWidget {
  const MaterialColors({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Color colors (int colorId) {
    switch (colorId) {
      case 0:
        return Colors.amber;
      case 1:
        return Colors.amberAccent;
      case 2:
        return Colors.black;
      case 3:
        return Colors.black12;
      case 4:
        return Colors.black26;
      case 5:
        return Colors.black45;
      case 6:
        return Colors.black54;
      case 7:
        return Colors.black87;
      case 8:
        return Colors.blue;
      case 9:
        return Colors.blueAccent;
      case 10:
        return Colors.blueGrey;
      case 11:
        return Colors.brown;
      case 12:
        return Colors.cyan;
      case 13:
        return Colors.cyanAccent;
      case 14:
        return Colors.deepOrange;
      case 15:
        return Colors.deepOrangeAccent;
      case 16:
        return Colors.deepPurple;
      case 17:
        return Colors.deepPurpleAccent;
      case 18:
        return Colors.green;
      case 19:
        return Colors.greenAccent;
      case 20:
        return Colors.grey;
      case 21:
        return Colors.indigo;
      case 22:
        return Colors.indigoAccent;
      case 23:
        return Colors.lightBlue;
      case 24:
        return Colors.lightBlueAccent;
      case 25:
        return Colors.lightGreen;
      case 26:
        return Colors.lightGreenAccent;
      case 27:
        return Colors.lime;
      case 28:
        return Colors.limeAccent;
      case 29:
        return Colors.orange;
      case 30:
        return Colors.orangeAccent;
      case 31:
        return Colors.pink;
      case 32:
        return Colors.pinkAccent;
      case 33:
        return Colors.purple;
      case 34:
        return Colors.purpleAccent;
      case 35:
        return Colors.red;
      case 36:
        return Colors.redAccent;
      case 37:
        return Colors.transparent;
      case 38:
        return Colors.teal;
      case 39:
        return Colors.tealAccent;
      case 40:
        return Colors.white;
      case 41:
        return Colors.white10;
      case 42:
        return Colors.white12;
      case 43:
        return Colors.white24;
      case 44:
        return Colors.white30;
      case 45:
        return Colors.white38;
      case 46:
        return Colors.white54;
      case 47:
        return Colors.white60;
      case 48:
        return Colors.white70;
      case 49:
        return Colors.yellow;
      case 50:
        return Colors.yellowAccent;
      default:
      return Colors.white;
    }

  }
  
}