import 'package:flutter/material.dart';
import 'package:flutter_nolbir/widgets/material_widgets.dart';

class MaterialItarasion extends StatelessWidget {
  const MaterialItarasion({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Widget mWidgets(
    BuildContext context,
    List<List<dynamic>> widgets
  ) {
    MaterialWidgets materialWidgets = MaterialWidgets();
    List<Widget> allWidgets = [];
    for (var i = 0; i < widgets.length; i++) {
      switch (widgets[i][0]) {
        case 0:
          allWidgets[i] = materialWidgets.createText(
            context,
            widgets[0][0],
          );
        case 1:
          allWidgets[i] = SizedBox();
        default:
          allWidgets[i] = Container();
      }
    }
    return ListView(children: allWidgets);
  }
}
