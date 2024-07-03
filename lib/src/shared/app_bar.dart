import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: isSettings
          ? IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/img/icons/search.svg"))
          : IconButton(
              onPressed: () => context.push('/profile',
                  extra: ref.watch(userStorageProvider).requireValue),
              icon: const Icon(Icons.person_outline)),
      title: Text(title),
      centerTitle: true,
      bottom: bottom,
      actions: [
        IconButton(
            onPressed: () => context.push("/notifications"),
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
