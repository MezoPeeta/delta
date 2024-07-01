import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.isSettings = false,
    required this.title,
    this.bottom,
  });

  final bool isSettings;
  final String title;
  final PreferredSize? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isSettings
          ? IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/img/icons/search.svg"))
          : IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_outline)),
      title: Text(title),
      centerTitle: true,
      bottom: bottom,
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/img/icons/notification.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
