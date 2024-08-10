import 'dart:developer';

import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/bookings/data/order.dart';
import 'package:delta/src/screens/bookings/providers/bookings_providers.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:delta/src/shared/app_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/navigation.dart';
import '../../styles/colors.dart';

class BookingsScreen extends ConsumerWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(getOrdersProvider);
    final user = ref.watch(userStorageProvider).requireValue;
    return Scaffold(
      appBar: const CustomAppBar(
        isSettings: false,
        title: "الحجوزات",
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(getOrdersProvider),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: orders.when(
              data: (data) {
                if (data.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const EmptyDataWidget(
                          text: "الحجوزات  فارغة!",
                          subText:
                              "لم تقم بحجز اي مصعد بعد , نحن في انتظار طلباتك عزيزي العميل قم باستكشاف منتجاتنا الان"),
                      const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: double.infinity, minHeight: 54),
                        child: ElevatedButton(
                            onPressed: () {
                              context.push("/products");
                            },
                            child: const Text("منتجاتنا")),
                      ),
                    ],
                  );
                }
                return ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            if (user!.isUserHasContract) {
                              context.push("/order", extra: data[index]);
                              return;
                            }
                            appBottomSheet(context,
                                header: "عرض طلب",
                                subHeader: "تم عرض الطلب بنجاح",
                                endHeader:
                                    "يمكنك متابعة حالة الطلب في سجل الحجوزات لديك و شكرا لاستخدامك تطبيق الدلتا رقم الطلب : 21343434341",
                                coloredText: const TextSpan(),
                                isRow: false,
                                actionButtons: [
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        minWidth: double.infinity,
                                        minHeight: 54),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        child: const Text("سجل الحجوزات")),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                        minWidth: double.infinity,
                                        minHeight: 54),
                                    child: OutlinedButton(
                                        onPressed: () {
                                          ref
                                              .read(
                                                  currentIndexProvider.notifier)
                                              .state = 0;
                                          context.pop();
                                        },
                                        child: const Text("الرئيسية")),
                                  ),
                                ]);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "طلب رقم: ${data[index].id}",
                                    style: TextStyle(
                                        color: AppColors.grayColor
                                            .withOpacity(0.7)),
                                  ),
                                  SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                        itemCount: data.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: data[index]
                                                .cartItems
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                          e.product?.name ??
                                                              ""),
                                                    ))
                                                .toList())),
                                  )
                                ],
                              )),
                        ));
              },
              error: (e, s) {
                log("[Error Order]", error: e, stackTrace: s);
                return const Center(child: Text("حدث خطا ما"));
              },
              loading: () => const Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }
}
