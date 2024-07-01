import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/settings/providers/settings_providers.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../shared/app_sheet.dart';
import 'settings.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Settings> tiles = [
      Settings(
        label: "الملف الشخصي",
        onTap: () => context.push("/profile", extra: ref.watch(userProvider)),
        icon: const Icon(Icons.person_outline),
      ),
      Settings(
        label: "العنواين",
        onTap: () => context.push("/addresses"),
        icon: SvgPicture.asset("assets/img/icons/address.svg"),
      ),
      Settings(
        label: "تغير كلمة السر",
        onTap: () => context.push("/change_pass"),
        icon: Container(
          alignment: Alignment.center,
          width: 18,
          height: 18,
          child: SvgPicture.asset(
            "assets/img/icons/key.svg",
          ),
        ),
      ),
      Settings(
        label: "حول الشركة",
        onTap: () => context.push("/about"),
        icon: const Icon(Icons.person_outline),
      ),
      Settings(
          label: "الاشعارات",
          onTap: () => context.push("/notifications"),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                const Text("غير مفعل"),
                SizedBox(
                  height: 35,
                  width: 50,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Switch(
                      inactiveTrackColor: Colors.white,
                      value: false,
                      onChanged: (v) {},
                      thumbColor: WidgetStatePropertyAll(AppColors.linkColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          icon: Container(
            alignment: Alignment.center,
            width: 18,
            height: 18,
            child: SvgPicture.asset(
              "assets/img/icons/notification.svg",
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          )),
      Settings(
        label: "شكاوي و اقتراحات",
        onTap: () => context.push("/feedback"),
        icon: const Icon(Icons.rate_review_outlined),
      ),
      Settings(
          label: "تسجيل خروج",
          isCritical: true,
          icon: Icon(
            Icons.logout_outlined,
            color: AppColors.errorColor,
          ),
          onTap: () => appBottomSheet(context,
              actionButtons: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 54),
                    child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text("الغاء")),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 54),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () async {
                          ref.read(logOutProvider);
                        },
                        child: const Text("خروج")),
                  ),
                ),
              ],
              header: "تسجيل خروج",
              coloredText: TextSpan(
                  text: "الخروج؟",
                  style: TextStyle(color: AppColors.warningColor)),
              subHeader: "هل انت متاكد من عملية تسجيل",
              isWarning: true,
              endHeader: 'هل أنت متأكد أنك تريد تسجيل الخروج؟')),
      Settings(
          label: "حذف الحساب",
          isCritical: true,
          icon: Icon(
            Icons.delete_outline,
            color: AppColors.errorColor,
          ),
          onTap: () => appBottomSheet(context,
              actionButtons: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 54),
                    child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: const Text("الغاء")),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 54),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {},
                        child: const Text("حذف")),
                  ),
                ),
              ],
              header: "حذف الحساب",
              coloredText: TextSpan(
                  text: "نهائي!",
                  style: TextStyle(color: AppColors.errorColor)),
              subHeader: "هل انت متاكد من حذف حسابك",
              isDanger: true,
              endHeader:
                  'هل متأكد من حذف حسابك سوف ( ستفقد جميع بياناتك ) !!')),
    ];

    return Scaffold(
        appBar: const CustomAppBar(
          isSettings: true,
          title: "الاعدادات",
        ),
        body: ListView.separated(
            itemCount: tiles.length,
            separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider()),
            itemBuilder: (context, index) => SettingTile(
                  label: tiles[index].label,
                  icon: tiles[index].icon,
                  trailing: tiles[index].trailing,
                  onTap: tiles[index].onTap,
                  isCritical: tiles[index].isCritical,
                )));
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile(
      {super.key,
      required this.label,
      required this.icon,
      this.onTap,
      this.trailing,
      this.isCritical = false});
  final String label;
  final Widget icon;
  final Function()? onTap;
  final bool isCritical;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(
                color: isCritical ? AppColors.errorColor : Colors.black),
            borderRadius: BorderRadius.circular(4)),
        child: icon,
      ),
      title: Text(
        label,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isCritical ? AppColors.errorColor : null),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 18,
          ),
    );
  }
}
