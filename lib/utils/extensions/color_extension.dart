import 'package:mobx_examle/utils/app_export.dart';

extension HexColor on String {
  Color toColor() {
    // Remove the '#' character if present
    final hexCode = this.replaceAll('#', '');
    // Parse the hex code and convert it to a Color object
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
