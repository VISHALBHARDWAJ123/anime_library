import 'package:google_fonts/google_fonts.dart';
import 'package:anime_library/utils/app_export.dart';

class SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onTap;

  const SliderMenuItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            color: Colors.black,
          )),
      leading: Icon(iconData, color: Colors.black),
      onTap: onTap,
    );
  }
}

class Menu {
  final IconData iconData;
  final String title, routeName;

  Menu(
    this.iconData,
    this.title, {
    required this.routeName,
  });
}
