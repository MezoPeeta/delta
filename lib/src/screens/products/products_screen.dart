import 'dart:developer';

import 'package:delta/src/screens/home/home_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
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
  String category = "الكل";
  int selectedIndex = 0;
  final pageSize = 20;
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getCategoriesProvider);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "منتجاتنا",
        isSettings: true,
      ),
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
                                  category = e.title;
                                });
                              },
                              child: CategoryWidget(
                                image: e.photo,
                                isSelected: e.title == category,
                                text: e.title,
                              ),
                            ))
                        .toList(),
                  );
                },
                error: (e, s) {
                  return const Text("حدث خطا ما");
                },
                loading: () => const SizedBox.shrink()),
            const SizedBox(
              height: 16,
            ),
            Text(
              "المنتجات - $category",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 174,
                  ),
                  itemBuilder: (context, index) {
                    final page = index ~/ pageSize + 1;
                    final indexInPage = index % pageSize;

                    final products = category != "الكل"
                        ? ref.watch(getProductsbyCategoryProvider(
                            category: category, page: page.toString()))
                        : ref.watch(getProductsProvider(page: page.toString()));

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
