import 'dart:developer';

import 'package:delta/src/screens/home/home_screen.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'provider/product_provider.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  String category = "Test18";
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final products =
        ref.watch(getProductsbyCategoryProvider(category: category));
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
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(
                height: 50,
                child: categories.when(
                    data: (data) {
                      return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 12,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              category = data[index].toString();
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: selectedIndex == index
                                ? BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.buttonColor),
                                    borderRadius: BorderRadius.circular(4))
                                : BoxDecoration(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              data[index],
                              style: TextStyle(
                                  color: selectedIndex == index
                                      ? AppColors.buttonColor
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                    error: (e, s) {
                      log("[Category Error]", error: e, stackTrace: s);
                      return const Text("حدث خطأ ما");
                    },
                    loading: () => const SizedBox.shrink())),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: products.when(
                  data: (data) {
                    return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 16,
                            ),
                        itemBuilder: (context, index) {
                          return ProductContainer(
                            name: data[index].name,
                            description: data[index].description,
                            image: data[index].mainPhoto,
                          );
                        });
                  },
                  error: (e, s) => const Center(child: Text("حدث خطأ ما")),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            )
          ],
        ),
      ),
    );
  }
}
