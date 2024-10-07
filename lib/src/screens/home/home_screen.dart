import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/home/provider/slider_provider.dart';
import 'package:delta/src/screens/order/order_screen.dart';
import 'package:delta/src/shared/navigation.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../providers/notification_provider.dart';
import '../discount/providers/cart_notifier.dart';
import '../products/data/product.dart';
import '../products/provider/services.dart';
import 'provider/search_provider.dart';

final queryProvider = StateProvider<String>((ref) => "");

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Product> queryProducts = [];
  @override
  void initState() {
    super.initState();
    ref.read(sendFCMTokenProvider);
  }

  String category = "الكل";
  final pageController = PageController();
  final pageSize = 20;
  bool loading = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStorageProvider);
    final services = ref.watch(servicesProvider);
    final slider = ref.watch(getSliderProvider);
    return Scaffold(
        body: SafeArea(
      left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: user.when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: ref.watch(queryProvider).isEmpty,
                      child: Row(
                        children: [
                          Container(
                            width: 63,
                            height: 63,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/img/brand_logo.png")),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "اهلا بك,",
                                style: TextStyle(
                                    fontSize: 12, color: AppColors.grayColor),
                              ),
                              Text(
                                data?.name ?? "",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => context.push("/notifications"),
                            child: Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                  color: AppColors.notificationColor,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                width: 18,
                                height: 18,
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                  "assets/img/icons/notification.svg",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                          borderRadius: BorderRadius.circular(12)),
                      child: SearchBar(
                        hintText: "ابحث هنا..",
                        onSubmitted: (v) {
                          if (v.isEmpty) {
                            setState(() {
                              queryProducts = [];
                            });
                          }
                        },
                        textInputAction: TextInputAction.search,
                        onChanged: (value) async {
                          setState(() {
                            loading = true;
                          });
                          ref.read(queryProvider.notifier).state = value;
                          if (value != "") {
                            await ref
                                .read(searchProductProvider(productName: value)
                                    .future)
                                .then((products) => setState(() {
                                      queryProducts = products.data.products;
                                    }));
                            if (value.isEmpty) {
                              setState(() {
                                queryProducts = [];
                              });
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        leading: const Icon(Icons.search_outlined),
                        elevation: const WidgetStatePropertyAll<double>(0),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.transparent),
                        shape: WidgetStatePropertyAll<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Visibility(
                      visible: ref.watch(queryProvider).isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${queryProducts.length} نتائج: \"${ref.watch(queryProvider)}\"",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Visibility(
                              visible: loading,
                              child: const Center(
                                  child: CircularProgressIndicator())),
                          Visibility(
                            visible: !loading,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: queryProducts
                                  .map((e) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: ProductContainer(product: e),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // HERE
                    Visibility(
                      visible: ref.watch(queryProvider).isEmpty,
                      child: const Text(
                        "احدث العروض",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Visibility(
                      visible: ref.watch(queryProvider).isEmpty,
                      child: SizedBox(
                          height: 190,
                          child: slider.when(
                              data: (data) {
                                if (data.data.photos.isEmpty) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.grayColor),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        "لا يوجد عروض اليوم",
                                        style: TextStyle(
                                            color: AppColors.grayColor),
                                      ),
                                    ),
                                  );
                                }
                                return Column(
                                  children: [
                                    Expanded(
                                      child: PageView.builder(
                                          controller: pageController,
                                          itemCount: data.data.photos.length,
                                          onPageChanged: (value) {
                                            setState(() {
                                              selectedIndex = value;
                                            });
                                          },
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () async {
                                                await ref
                                                    .read(cartNotifierProvider
                                                        .notifier)
                                                    .addToCart(
                                                        productID: data
                                                            .data
                                                            .photos[index]
                                                            .productId);
                                                ref
                                                    .read(currentIndexProvider
                                                        .notifier)
                                                    .state = 2;
                                              },
                                              child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width -
                                                          20,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fitHeight,
                                                          image: NetworkImage(
                                                              data
                                                                  .data
                                                                  .photos[index]
                                                                  .photoUrl)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12))),
                                            );
                                          }),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children:
                                            data.data.photos.mapIndexed((i, e) {
                                          return SizedBox(
                                            width: 25,
                                            child: Radio(
                                                activeColor: Colors.black,
                                                value: i == selectedIndex,
                                                groupValue: true,
                                                onChanged: (_) {}),
                                          );
                                        }).toList()),
                                  ],
                                );
                              },
                              error: (e, s) {
                                log("Cannt get Slider",
                                    error: e, stackTrace: s);
                                return const Text("حدث خطأ ما");
                              },
                              loading: () => const Center(
                                  child:
                                      CircularProgressIndicator.adaptive()))),
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: ref.watch(queryProvider).isEmpty,
                      child: const Text(
                        "خدمتنا",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Visibility(
                      visible: ref.watch(queryProvider).isEmpty,
                      child: GridView.builder(
                          itemCount: services.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            mainAxisExtent: 147,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.push(services[index].routePath);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: AppColors.backContainerColor,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.grayColor),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      height: 80,
                                      child: Container(
                                        width: 32,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                            width: 32, services[index].icon),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      services[index].title,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
            },
            error: (e, s) {
              log("[Home Screen Error]", error: e, stackTrace: s);
              return const Center(child: Text("حدث خطأ ما"));
            },
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive())),
      ),
    ));
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.isSelected,
    required this.text,
    this.image,
  });

  final bool isSelected;
  final String text;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: 56,
      width: text.length <= 5
          ? text != "الكل"
              ? text == "ابواب"
                  ? width / (width >= 481 ? 7 : 4)
                  : width / (width >= 481 ? 7 : 3.7)
              : 60
          : 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue.withOpacity(0.2)
              : const Color(0xFFECECEC),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text != "الكل"
              ? Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(image!))),
                )
              : const SizedBox.shrink(),
          Visibility(
            visible: text != "الكل",
            child: const SizedBox(
              width: 8,
            ),
          ),
          Text(
            text,
            maxLines: 1,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/products/detail", extra: product),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 172,
        height: 174,
        decoration: BoxDecoration(
            color: AppColors.backContainerColor,
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 83,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                            product.mainPhoto ?? "")),
                    borderRadius: BorderRadius.circular(5))),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              product.description ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.assetImage,
    required this.text,
    this.onTap,
  });
  final String assetImage, text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.srcATop),
                image: AssetImage(
                  assetImage,
                ))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
