import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/discount/providers/cart_notifier.dart';
import 'package:delta/src/screens/products/data/product.dart';
import 'package:delta/src/screens/products/provider/product_provider.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/navigation.dart';
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 54),
            child: Consumer(builder: (context, ref, child) {
              final loading = ref.watch(loadingProvider);
              return ElevatedButton(
                  onPressed: () async {
                    final isGuest = ref.read(isGuestProvider);
                    if (isGuest) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => LoginRequiredDialog(context));
                      return;
                    }
                    ref.read(loadingProvider.notifier).state = true;

                    final products = ref.read(listOfProductsProvider);
                    if (products.contains(product)) {
                      return;
                    }
                    ref
                        .read(listOfProductsProvider.notifier)
                        .update((state) => List.from(state)..add(product));
                    await ref
                        .read(cartNotifierProvider.notifier)
                        .addToCart(productID: product.id);
                    ref.read(loadingProvider.notifier).state = false;
                    if (!context.mounted) return;
                    ref.read(currentIndexProvider.notifier).state = 2;
                    context.go("/");
                  },
                  child: loading
                      ? const CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : const Text("طلب العرض"));
            })),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(
                      imageUrl:
                          product.mainPhoto!, // Replace with your image URL
                    ),
                  ),
                );
              },
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(product.mainPhoto!))),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Visibility(
              visible: product.photos?.isNotEmpty ?? false,
              child: SizedBox(
                height: 50,
                child: ListView.separated(
                  itemCount: product.photos?.length ?? 0,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
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
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "الوصف",
                    style: TextStyle(fontSize: 16),
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
                  Consumer(builder: (context, ref, child) {
                    final relatedProducts = ref.watch(
                        getRelatedProductsProvider(productID: product.id));
                    return relatedProducts.when(
                        data: (data) {
                          return Column(
                            children: [
                              const Text(
                                "منتجات ذات صلة:",
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Column(
                                  children: data
                                      .map((e) =>
                                          SmallProductContainer(product: e))
                                      .toList()),
                            ],
                          );
                        },
                        error: (e, s) {
                          log("Error Product Detail", error: e, stackTrace: s);
                          return const Text("حدث خطا ما");
                        },
                        loading: () => const CircularProgressIndicator());
                  }),
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
                    fit: BoxFit.fitHeight,
                    image:
                        CachedNetworkImageProvider(product?.mainPhoto ?? "")),
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

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Close fullscreen when tapped
        },
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Image.network(imageUrl),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: CloseButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
