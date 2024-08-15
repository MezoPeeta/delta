import 'package:delta/src/screens/discount/providers/cart_notifier.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/screens/products/products_screen.dart';
import 'package:delta/src/screens/products/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

import '../../styles/colors.dart';

final listOfProductsProvider = StateProvider<List<Product>>((ref) => []);
final loadingProvider = StateProvider<bool>((ref) => false);

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.mainPhoto!))),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: product.photos?.length ?? 0,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) => Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.photos![index])))),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "الوصف",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ReadMoreText(
                    product.description!,
                    trimMode: TrimMode.Line,
                    trimLines: 5,
                    style: TextStyle(color: AppColors.grayColor),
                    trimCollapsedText: 'قراءة المزيد',
                    trimExpandedText: 'قراءة القليل',
                    colorClickableText: AppColors.linkColor,
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.linkColor,
                        color: AppColors.linkColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "منتجات ذات صلة:",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SmallProductContainer(
                    product: product,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: double.infinity, minHeight: 54),
                      child: Consumer(builder: (context, ref, child) {
                        final loading = ref.watch(loadingProvider);
                        return ElevatedButton(
                            onPressed: () async {
                              ref.read(loadingProvider.notifier).state = true;

                              final products = ref.read(listOfProductsProvider);
                              if (products.contains(product)) {
                                return;
                              }
                              ref.read(listOfProductsProvider.notifier).update(
                                  (state) => List.from(state)..add(product));
                              await ref
                                  .read(cartNotifierProvider.notifier)
                                  .addToCart(productID: product.id);
                              ref.read(loadingProvider.notifier).state = false;
                            },
                            child: loading
                                ? const CircularProgressIndicator.adaptive(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text("طلب العرض"));
                      })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SmallProductContainer extends StatelessWidget {
  const SmallProductContainer({
    super.key,
    required this.product,
  });
  final Product? product;
  @override
  Widget build(BuildContext context) {
    if (product == null) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(),
          color: AppColors.grayColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product?.mainPhoto ?? "")),
                borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product?.name ?? ""),
              Text(
                product?.description ?? "",
                style: TextStyle(color: AppColors.grayColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
