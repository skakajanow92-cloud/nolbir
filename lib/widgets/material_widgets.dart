import 'package:flutter/material.dart';
import 'package:flutter_nolbir/utils/exports.dart';
import 'package:flutter_nolbir/widgets/material_colors.dart';
import 'package:flutter_nolbir/widgets/material_icons.dart';

// ignore: must_be_immutable
class MaterialWidgets extends StatelessWidget {
  MaterialWidgets({super.key});
  MaterialColors materialColors = MaterialColors();
  MaterialIcons materialIcons = MaterialIcons();
  Utils1 utils1 = Utils1();
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Widget createListTile(BuildContext context, List<List<dynamic>> params) {
    return ListTile(
      title: createText(context, params[0]),
      subtitle: createText(context, params[1]),
      leading: materialIcons.generalIcons(params[2][3]),
      trailing: materialIcons.generalIcons(params[2][4]),
      onTap: () {
        utils1.functions(funcNumber: params[2][0]);
      },
      onLongPress: () {
        utils1.functions(funcNumber: params[2][1]);
      },
      tileColor: materialColors.colors(params[2][2]),
    );
  }

  Widget createText(BuildContext context, List<dynamic> params) {
    return Text(
      params[0],
      style: TextStyle(
        color: materialColors.colors(params[1]),
        fontSize: params[2],
      ),
    );
  }

  Widget createTextButton(BuildContext context, List<List<dynamic>> params) {
    return TextButton(
      onPressed: utils1.functions(funcNumber: params[0][0]),
      child: createText(context, params[1]),
    );
  }

  Widget createElevatedButton(
    BuildContext context,
    List<List<dynamic>> params,
  ) {
    if (params[0][0] == 0) {
      return ElevatedButton(
        onPressed: utils1.functions(funcNumber: params[1][0]),
        child: materialIcons.generalIcons(params[1]),
      );
    } else if (params[0][0] == 1) {
      return ElevatedButton(
        onPressed: utils1.functions(funcNumber: params[1][0]),
        child: createText(context, params[2]),
      );
    } else if (params[0][0]==2) {
      return ElevatedButton(
        onPressed: utils1.functions(funcNumber: params[1][0]),
        child: Column(
          children: [
            materialIcons.generalIcons(params[1]),
            createText(context, params[2]),
          ],
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: utils1.functions(funcNumber: params[1][0]),
        child: Row(
          children: [
            materialIcons.generalIcons(params[1]),
            createText(context, params[2]),
          ],
        ),
      );
    }
  }
}
