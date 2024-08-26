import 'dart:developer';

import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/screens/settings/deals/provider/deals_provider.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DealsScreen extends ConsumerWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contracts = ref.watch(getMaintenaceContractsProvider);
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
            child: contracts.when(
                data: (data) {
                  if (data.isEmpty) {
                    return const EmptyDataWidget(
                        text: "لا يوجد طلب صيانة لديك!", subText: "");
                  }
                  return ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
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
                                    ref.read(downloadContractPDFProvider(
                                        pdfID: data[index]));
                                  },
                                  child: const Text("تنزيل"))
                            ],
                          ),
                        );
                      });
                },
                error: (e, s) {
                  log("Maintenace Error", error: e, stackTrace: s);
                  return const Center(
                    child: Text("حدث خطا ما"),
                  );
                },
                loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ))));
  }
}
