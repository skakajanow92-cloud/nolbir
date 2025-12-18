import 'package:flutter/material.dart';
//import 'package:flutter_nolbir/widgets/material_colors.dart';
//import 'package:flutter_nolbir/widgets/material_icons.dart';
import 'package:flutter_nolbir/widgets/material_widgets.dart';

class App001main extends StatelessWidget {
  const App001main({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialWidgets materialWidgets = MaterialWidgets();
    //MaterialColors materialColors = MaterialColors();
    //MaterialIcons materialIcons = MaterialIcons();
    List<dynamic> textAppBar = ['App1', 12, 17.0];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: materialWidgets.createText(context, textAppBar)),
        body: Center(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }

  
}
