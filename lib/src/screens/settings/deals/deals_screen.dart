import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DealsScreen extends ConsumerWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("عقود الصيانة"),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: ElevatedButton(
                  onPressed: () => context.push('/repair'),
                  child: const Text("طلب صيانة"))),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return Container(
                  height: 56,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("عقد الصيانة"),
                      OutlinedButton(
                          onPressed: () {
                            final userID =
                                ref.read(userStorageProvider).requireValue?.id;
                            ref.read(
                                downloadContractPDFProvider(userID: userID!));
                          },
                          child: const Text("تنزيل"))
                    ],
                  ),
                );
              }),
        ));
  }
}
