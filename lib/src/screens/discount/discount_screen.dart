import 'package:delta/src/screens/auth/login/login_providers.dart';
import 'package:delta/src/screens/products/product_detail.dart';
import 'package:delta/src/screens/settings/addresses/providers/address_providers.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:delta/src/shared/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../shared/app_sheet.dart';
import '../../styles/icons.dart';
import '../auth/widgets/text_form.dart';
import '../repair/repair_screen.dart';
import 'providers/orders_providers.dart';

class DiscountScreen extends ConsumerStatefulWidget {
  const DiscountScreen({super.key});

  @override
  ConsumerState<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends ConsumerState<DiscountScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStorageProvider).requireValue;
    final nameController = TextEditingController(text: user!.name);
    final phoneController = TextEditingController(text: user.phone);
    final orderedProducts = ref.watch(listOfProductsProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: "طلب عرض"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                            children: [Icon(Icons.add), Text("اضافة منتج")],
                          )),
                    ),
                  ],
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
                AddContainer(
                  address: ref.watch(choosenAddressProvider),
                ),
                const SizedBox(
                  height: 16,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 54),
                  child: OutlinedButton(
                      onPressed: () {
                        context.push("/addresses");
                      },
                      child: const Text("اختيار عنوان اخر")),
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
                  visible: orderedProducts.isNotEmpty,
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
                      Column(
                        children: orderedProducts
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: SmallProductContainer(product: e),
                                ))
                            .toList(),
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
                                  final address =
                                      ref.read(choosenAddressProvider);
                                  ref
                                      .read(sendOrderProvider(
                                              address: address!.id)
                                          .future)
                                      .then((e) {
                                    if (e == 200) {
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
                                              constraints: const BoxConstraints(
                                                  minWidth: double.infinity,
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
                                                  child:
                                                      const Text("الرئيسية")),
                                            ),
                                          ]);
                                    }
                                  });
                                },
                                child: const Text("تقديم الطلب"));
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
