import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/screens/products/product_detail.dart';
import 'package:delta/src/screens/sales/provider/sales_provider.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SalesScreen extends ConsumerWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sales = ref.watch(getAllSalesProvider);
    return Scaffold(
        appBar: const CustomAppBar(
          title: "المبيعات",
          isSettings: true,
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: sales.when(
                data: (data) {
                  return ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push("/sales/detail", extra: data[index]);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.grayColor),
                                color: const Color(0xFFF1F1F3),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.person_4_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(data[index].name)
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                error: (e, s) {
                  return const Text("حدث خطا ما");
                },
                loading: () => const Center(
                    child: CircularProgressIndicator.adaptive()))));
  }
}
