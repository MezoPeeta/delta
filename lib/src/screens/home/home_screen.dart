import 'dart:developer';

import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/products/provider/product_provider.dart';
import 'package:delta/src/screens/repair/repair_screen.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../providers/notification_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(sendFCMTokenProvider);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStorageProvider);
    final products = ref.watch(getProductsProvider);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: user.when(
            data: (data) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 63,
                          height: 63,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/img/brand_logo.png")),
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
                                color: AppColors.buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                              width: 18,
                              height: 18,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                "assets/img/icons/notification.svg",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: SearchBar(
                        hintText: "ابحث هنا..",
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: StaggeredGrid.count(
                        crossAxisCount: 6,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
                        children: const [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: CategoryContainer(
                                assetImage: "assets/img/cabins.png",
                                text: "كباين",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 1.5,
                              child: CategoryContainer(
                                assetImage: "assets/img/kbsat.png",
                                text: "كبسات",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.5,
                              child: CategoryContainer(
                                assetImage: "assets/img/sa2f.png",
                                text: "سقف المصعد",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 3,
                              child: CategoryContainer(
                                assetImage: "assets/img/doors.png",
                                text: "ابواب",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.5,
                              child: CategoryContainer(
                                assetImage: "assets/img/all.png",
                                text: "عرض الكل",
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: CategoryContainer(
                                assetImage: "assets/img/ms3d.png",
                                text: "ارضية المصعد",
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "منتجاتنا",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "عرض الكل",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grayColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.grayColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    products.when(
                        data: (data) {
                          return Column(
                            children: data
                                .map((e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: ProductContainer(
                                        name: e.name,
                                        description: e.description,
                                        image: e.mainPhoto,
                                      ),
                                    ))
                                .toList(),
                          );
                        },
                        error: (e, s) => const Text("حدث خطأ ما"),
                        loading: () => const CircularProgressIndicator())
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

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.name,
    required this.description,
    required this.image,
  });

  final String name, description, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: 255,
      decoration: BoxDecoration(
          color: AppColors.grayColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(image)),
                  borderRadius: BorderRadius.circular(12))),
          const SizedBox(
            height: 18,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.assetImage,
    required this.text,
  });
  final String assetImage, text;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
