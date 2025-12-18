import 'package:flutter/material.dart';
import 'package:flutter_nolbir/widgets/material_colors.dart';

class MaterialIcons extends StatelessWidget {
  const MaterialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  Icon generalIcons(List<dynamic> params) {
    MaterialColors materialColors = MaterialColors();
    switch (params[0]) {
      case 0:
        return Icon(
          Icons.home,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 1:
        return Icon(
          Icons.menu,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 2:
        return Icon(
          Icons.arrow_back,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 3:
        return Icon(
          Icons.arrow_forward,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 4:
        return Icon(
          Icons.close,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 5:
        return Icon(
          Icons.settings,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 6:
        return Icon(
          Icons.search,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 7:
        return Icon(
          Icons.notifications,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 8:
        return Icon(
          Icons.favorite,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 9:
        return Icon(
          Icons.favorite_border,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 10:
        return Icon(
          Icons.person,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 11:
        return Icon(
          Icons.info,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 12:
        return Icon(
          Icons.more_vert,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 13:
        return Icon(
          Icons.check,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 14:
        return Icon(
          Icons.add,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 15:
        return Icon(
          Icons.edit,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 16:
        return Icon(
          Icons.delete,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 17:
        return Icon(
          Icons.save,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 18:
        return Icon(
          Icons.share,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 19:
        return Icon(
          Icons.send,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 20:
        return Icon(
          Icons.refresh,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 21:
        return Icon(
          Icons.upload,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 22:
        return Icon(
          Icons.download,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 23:
        return Icon(
          Icons.cancel,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 24:
        return Icon(
          Icons.filter_list,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 25:
        return Icon(
          Icons.sort,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 26:
        return Icon(
          Icons.email,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 27:
        return Icon(
          Icons.call,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 28:
        return Icon(
          Icons.chat_bubble,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 29:
        return Icon(
          Icons.mic,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 30:
        return Icon(
          Icons.videocam,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 31:
        return Icon(
          Icons.photo_camera,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 32:
        return Icon(
          Icons.play_arrow,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 33:
        return Icon(
          Icons.pause,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 34:
        return Icon(
          Icons.volume_up,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 35:
        return Icon(
          Icons.location_on,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 36:
        return Icon(
          Icons.attach_file,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 37:
        return Icon(
          Icons.folder,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 38:
        return Icon(
          Icons.file_copy,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 39:
        return Icon(
          Icons.description,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 40:
        return Icon(
          Icons.insert_drive_file,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 41:
        return Icon(
          Icons.visibility,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 42:
        return Icon(
          Icons.visibility_off,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 43:
        return Icon(
          Icons.star,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 44:
        return Icon(
          Icons.star_border,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 45:
        return Icon(
          Icons.event,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 46:
        return Icon(
          Icons.schedule,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 47:
        return Icon(
          Icons.shopping_cart,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 48:
        return Icon(
          Icons.help_outline,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      case 49:
        return Icon(
          Icons.add_link,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
      default:
        return Icon(
          Icons.abc,
          color: materialColors.colors(params[1]),
          size: params[2],
        );
    }
  }
}
