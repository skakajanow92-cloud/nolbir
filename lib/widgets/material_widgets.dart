import 'package:flutter/material.dart';
import 'package:flutter_nolbir/utils/exports.dart';
import 'package:flutter_nolbir/widgets/material_colors.dart';
import 'package:flutter_nolbir/widgets/material_icons.dart';

// --- Model Sınıfları: Tip Güvenliği ve Okunabilirlik İçin ---

class TextParams {
  final String text;
  final int colorCode;
  final double fontSize;

  // Eski List<dynamic> yapısından kolayca geçiş yapmak için.
  TextParams.fromList(List<dynamic> list)
    : text = list[0] as String,
      colorCode = list[1] as int,
      fontSize = (list[2] as num).toDouble();
}

class ListTileParams {
  final TextParams title;
  final TextParams subtitle;
  final List<dynamic> leadingIconData;
  final List<dynamic> trailingIconData;
  final int onTapFuncId;
  final int onLongPressFuncId;
  final int tileColorCode;

  ListTileParams.fromList(List<List<dynamic>> list)
    : title = TextParams.fromList(list[0]),
      subtitle = TextParams.fromList(list[1]),
      onTapFuncId = list[2][0] as int,
      onLongPressFuncId = list[2][1] as int,
      tileColorCode = list[2][2] as int,
      leadingIconData = list[2][3] as List<dynamic>,
      trailingIconData = list[2][4] as List<dynamic>;
}

enum ElevatedButtonType { iconOnly, textOnly, iconTextColumn, iconTextRow }

class ElevatedButtonParams {
  final ElevatedButtonType type;
  final int onPressedFuncId;
  final List<dynamic> iconData;
  final TextParams? textParams;

  ElevatedButtonParams.fromList(List<List<dynamic>> list)
    : type = ElevatedButtonType.values[list[0][0] as int],
      onPressedFuncId = list[1][0] as int,
      iconData = list[1],
      textParams = list.length > 2 ? TextParams.fromList(list[2]) : null;
}

class TextButtonParams {
  final int onPressedFuncId;
  final TextParams textParams;

  TextButtonParams.fromList(List<List<dynamic>> list)
    : onPressedFuncId = list[0][0] as int,
      textParams = TextParams.fromList(list[1]);
}

// --- Modernize Edilmiş Widget Fabrikası Sınıfı ---

class MaterialWidgets {
  final MaterialColors materialColors = MaterialColors();
  final MaterialIcons materialIcons = MaterialIcons();
  // Utils1 bir singleton olduğu için doğrudan fabrika yapıcısını çağırabiliriz.
  final Utils1 utils1 = Utils1();

  Widget createListTile(BuildContext context, ListTileParams params) {
    return ListTile(
      title: createText(context, params.title),
      subtitle: createText(context, params.subtitle),
      leading: materialIcons.generalIcons(params.leadingIconData),
      trailing: materialIcons.generalIcons(params.trailingIconData),
      onTap: () => utils1.functions(funcNumber: params.onTapFuncId),
      onLongPress: () => utils1.functions(funcNumber: params.onLongPressFuncId),
      tileColor: materialColors.colors(params.tileColorCode),
    );
  }

  Widget createText(BuildContext context, TextParams params) {
    return Text(
      params.text,
      style: TextStyle(
        color: materialColors.colors(params.colorCode),
        fontSize: params.fontSize,
      ),
    );
  }

  Widget createTextButton(BuildContext context, TextButtonParams params) {
    return TextButton(
      onPressed: () => utils1.functions(funcNumber: params.onPressedFuncId),
      child: createText(context, params.textParams),
    );
  }

  Widget createElevatedButton(
    BuildContext context,
    ElevatedButtonParams params,
  ) {
    final onPressed = () =>
        utils1.functions(funcNumber: params.onPressedFuncId);

    switch (params.type) {
      case ElevatedButtonType.iconOnly:
        return ElevatedButton(
          onPressed: onPressed,
          child: materialIcons.generalIcons(params.iconData),
        );
      case ElevatedButtonType.textOnly:
        return ElevatedButton(
          onPressed: onPressed,
          child: createText(context, params.textParams!),
        );
      case ElevatedButtonType.iconTextColumn:
        return ElevatedButton(
          onPressed: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              materialIcons.generalIcons(params.iconData),
              if (params.textParams != null)
                createText(context, params.textParams!),
            ],
          ),
        );
      case ElevatedButtonType.iconTextRow:
        return ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              materialIcons.generalIcons(params.iconData),
              const SizedBox(width: 8),
              if (params.textParams != null)
                createText(context, params.textParams!),
            ],
          ),
        );
    }
  }
}
