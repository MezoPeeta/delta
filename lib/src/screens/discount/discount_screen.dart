import 'dart:developer';

import 'package:delta/src/app.dart';
import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/discount/providers/cart_notifier.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/screens/products/product_detail.dart';
import 'package:delta/src/screens/products/provider/product_provider.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:delta/src/shared/navigation.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/app_sheet.dart';
import '../auth/widgets/text_form.dart';
import '../products/data/product.dart';
import '../repair/repair_screen.dart';
import 'providers/order_notifier.dart';

class DiscountScreen extends ConsumerStatefulWidget {
  const DiscountScreen({super.key});

  @override
  ConsumerState<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends ConsumerState<DiscountScreen> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;

  List<String> wantedCategories = ["ابواب", "ارضية", "كباين"];

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStorageProvider).requireValue;
    final nameController = TextEditingController(text: user!.name);
    final phoneController = TextEditingController(text: user.phone);
    final orderedProducts = ref.watch(listOfProductsProvider);
    final cartItems = ref.watch(cartNotifierProvider);
    final isGuest = user.name == "زائر";
    return Scaffold(
      appBar: const CustomAppBar(title: "طلب عرض"),
      body: isGuest
          ? const LoginRequiredWidget()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: !cartItems.hasValue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "طلباتك",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push("/products");
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 130,
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      Text("اضافة منتج")
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "العنوان",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(
                            "/addresses",
                          );
                        },
                        child: AddContainer(
                          address: ref.watch(choosenAddressProvider),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                            minWidth: double.infinity, minHeight: 54),
                        child: OutlinedButton(
                            onPressed: () {
                              context.push("/add_address");
                            },
                            child: const Text("اضافة عنوان")),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextForm(
                          controller: nameController,
                          readOnly: true,
                          labelName: "اسمك",
                          hintText: "قم بأدخال أسمك الشخصي",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "ارجو ادخال اسم الخاص بيك";
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person_outline)),
                      const SizedBox(
                        height: 16,
                      ),
                      TextForm(
                          readOnly: true,
                          controller: phoneController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "برجاء ادخال رقم الهاتف الخاص بك";
                            }
                            return null;
                          },
                          labelName: "رقم الهاتف",
                          hintText: "قم بأدخال البريد الخاصه بك",
                          prefixIcon: const Icon(Icons.phone_outlined)),
                      const SizedBox(
                        height: 12,
                      ),
                      Visibility(
                        visible:
                            cartItems.hasValue || orderedProducts.isNotEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "طلباتك",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            cartItems.when(
                                data: (data) {
                                  return Column(
                                    children: data.map((e) {
                                      return GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (builder) {
                                                return SizedBox(
                                                  width: double.infinity,
                                                  height: 200,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                "هل تريد حذف ${e.product?.name} من الطلب",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 80,
                                                              height: 80,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: NetworkImage(e
                                                                              .product
                                                                              ?.mainPhoto ??
                                                                          "")),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4)),
                                                            ),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  ConstrainedBox(
                                                                constraints:
                                                                    const BoxConstraints(
                                                                        minHeight:
                                                                            54),
                                                                child: ElevatedButton(
                                                                    onPressed: () =>
                                                                        context
                                                                            .pop(),
                                                                    child: const Text(
                                                                        "الغاء")),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 16,
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  ConstrainedBox(
                                                                constraints:
                                                                    const BoxConstraints(
                                                                        minHeight:
                                                                            54),
                                                                child: OutlinedButton(
                                                                    style: ButtonStyle(shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
                                                                    onPressed: () {
                                                                      ref
                                                                          .read(
                                                                              listOfProductsProvider)
                                                                          .remove(
                                                                              e.product);
                                                                      ref.read(cartNotifierProvider.notifier).deleteFromCart(
                                                                          productID: e
                                                                              .product!
                                                                              .id);

                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child: const Text("حذف")),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Dismissible(
                                          key: UniqueKey(),
                                          background: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.errorColor,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: const Center(
                                              child: Text(
                                                "حذف",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onDismissed: (_) {
                                            ref
                                                .read(listOfProductsProvider)
                                                .remove(e.product);
                                            ref
                                                .read(cartNotifierProvider
                                                    .notifier)
                                                .deleteFromCart(
                                                    productID: e.product!.id);
                                          },
                                          child: e.product != null
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: SmallProductContainer(
                                                      product: e.product),
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                                error: (e, s) {
                                  log("Cant get cart items",
                                      error: e, stackTrace: s);
                                  return const Text("حدث خطأ ما");
                                },
                                loading: () => const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    )),
                            Visibility(
                              visible: cartItems.hasValue,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.push("/products");
                                    },
                                    child: Container(
                                      height: 79,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.grayColor),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add,
                                              color: AppColors.grayColor),
                                          Text(
                                            "أضافة منتج",
                                            style: TextStyle(
                                                color: AppColors.grayColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity, minHeight: 54),
                                child: Consumer(builder: (context, ref, child) {
                                  return ElevatedButton(
                                      onPressed: () async {
                                        setState(() {
                                          loading = true;
                                        });

                                        final address =
                                            ref.read(choosenAddressProvider);
                                        if (address == null) {
                                          snackbarKey.currentState!
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      "ارجو اختيار عنوان")));
                                          setState(() {
                                            loading = false;
                                          });
                                          return;
                                        }
                                        final status = await ref.read(
                                            sendOrderProvider(
                                                    address: address.id)
                                                .future);
                                        print(status);
                                        if (status == 201) {
                                          if (!context.mounted) return;
                                          appBottomSheet(context,
                                              header: "عرض طلب",
                                              subHeader: "تم عرض الطلب بنجاح",
                                              endHeader:
                                                  "يمكنك متابعة حالة الطلب في سجل الحجوزات لديك و شكرا لاستخدامك تطبيق الدلتا",
                                              coloredText: const TextSpan(),
                                              isRow: false,
                                              actionButtons: [
                                                ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                          minWidth:
                                                              double.infinity,
                                                          minHeight: 54),
                                                  child: ElevatedButton(
                                                      onPressed: () {
                                                        ref
                                                            .read(
                                                                currentIndexProvider
                                                                    .notifier)
                                                            .state = 1;
                                                        context.pop();
                                                      },
                                                      child: const Text(
                                                          "سجل الحجوزات")),
                                                ),
                                                const SizedBox(
                                                  height: 18,
                                                ),
                                                ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                          minWidth:
                                                              double.infinity,
                                                          minHeight: 54),
                                                  child: OutlinedButton(
                                                      onPressed: () {
                                                        ref
                                                            .read(
                                                                currentIndexProvider
                                                                    .notifier)
                                                            .state = 0;
                                                        context.pop();
                                                      },
                                                      child: const Text(
                                                          "الرئيسية")),
                                                ),
                                              ]);
                                          formKey.currentState!.reset();
                                        }
                                        setState(() {
                                          loading = false;
                                        });
                                      },
                                      child: loading
                                          ? const CircularProgressIndicator
                                              .adaptive(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            )
                                          : const Text("تقديم الطلب"));
                                })),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
