import 'package:delta/src/screens/bookings/bookings_screen.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../screens/discount/discount_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/repair/repair_screen.dart';
import '../screens/settings/settings_screen.dart';
import 'routes.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

final List<Widget> _children = [
  const HomeScreen(),
  const BookingsScreen(),
  const RepairScreen(),
  const DiscountScreen(),
  const SettingsScreen(),
];

class Navigation extends ConsumerStatefulWidget {
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? TextStyle(color: AppColors.buttonColor)
                  : TextStyle(color: AppColors.grayColor),
            ),
          ),
          child: NavigationBar(
              indicatorShape: null,
              indicatorColor: Colors.transparent,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              elevation: 15,
              selectedIndex: ref.watch(currentIndexProvider),
              backgroundColor: Colors.white,
              onDestinationSelected: (value) =>
                  ref.read(currentIndexProvider.notifier).state = value,
              destinations: [
                NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/img/icons/home.svg",
                      colorFilter: ColorFilter.mode(
                          ref.watch(currentIndexProvider) == 0
                              ? AppColors.buttonColor
                              : AppColors.grayColor,
                          BlendMode.srcIn),
                    ),
                    label: "الرئيسية"),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/img/icons/reservations.svg",
                      colorFilter: ColorFilter.mode(
                          ref.watch(currentIndexProvider) == 1
                              ? AppColors.buttonColor
                              : AppColors.grayColor,
                          BlendMode.srcIn),
                    ),
                    label: "الحجوزات"),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/img/icons/repair.svg",
                      colorFilter: ColorFilter.mode(
                          ref.watch(currentIndexProvider) == 2
                              ? AppColors.buttonColor
                              : AppColors.grayColor,
                          BlendMode.srcIn),
                    ),
                    label: "الصيانة"),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/img/icons/order.svg",
                      colorFilter: ColorFilter.mode(
                          ref.watch(currentIndexProvider) == 3
                              ? AppColors.buttonColor
                              : AppColors.grayColor,
                          BlendMode.srcIn),
                    ),
                    label: "طلب عرض"),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      "assets/img/icons/settings.svg",
                      colorFilter: ColorFilter.mode(
                          ref.watch(currentIndexProvider) == 4
                              ? AppColors.buttonColor
                              : AppColors.grayColor,
                          BlendMode.srcIn),
                    ),
                    label: "الاعدادات"),
              ]),
        ),
      ),
      body: _children[ref.watch(currentIndexProvider)],
    );
  }
}
