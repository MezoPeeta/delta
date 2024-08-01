import 'dart:developer';

import 'package:delta/src/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors.dart';
import 'provider/product_provider.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  String category = "all";
  int selectedIndex = 0;
  final pageSize = 20;
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getCategoriesProvider);

    return Scaffold(
      appBar:
          AppBar(title: const Text("منتجاتنا"), centerTitle: true, actions: [
        IconButton(
            onPressed: () {
              context.push('/notifications');
            },
            icon: const Icon(Icons.notifications_outlined)),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categories.when(
                data: (data) {
                  return Wrap(
                    spacing: 8.0, // Add space between children
                    runSpacing: 4.0, // Add space between rows
                    children: data
                        .map((e) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  category = e.title!;
                                });
                              },
                              child: CategoryWidget(
                                image: e.photo!,
                                isSelected: e.title == category,
                                text: e.title!,
                              ),
                            ))
                        .toList(),
                  );
                },
                error: (e, s) {
                  log("[Category Error]", error: e, stackTrace: s);
                  return const Text("حدث خطأ ما");
                },
                loading: () => const SizedBox.shrink()),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 270,
                      maxCrossAxisExtent: 200),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;
                    final products = ref.watch(getProductsbyCategoryProvider(
                        category: category, page: page.toString()));

                    log("index: $index, page: $page, indexInPage: $indexInPage");
                    return products.when(
                        data: (data) {
                          if (indexInPage >= data.length) {
                            return null;
                          }
                          return ProductContainer(product: data[indexInPage]);
                        },
                        error: (e, s) => const Text("حدث خطأ ما"),
                        loading: () => Center(
                                child: Container(
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.grayColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12)),
                            )));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
