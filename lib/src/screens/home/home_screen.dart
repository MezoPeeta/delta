import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStorageProvider);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: user.when(
            data: (data) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 63,
                        height: 63,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "هلا ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            data.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 43,
                        height: 43,
                        decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Container(
                          width: 18,
                          height: 18,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            "assets/img/icons/notification.svg",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
            error: (e, s) => const Center(child: Text("حدث خطأ ما")),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive())),
      ),
    ));
  }
}
