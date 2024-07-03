import 'package:delta/src/screens/settings/addresses/data/address.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../auth/widgets/text_form.dart';

final choosenAddressProvider = StateProvider<Address?>((ref) {
  return null;
});

class RepairScreen extends ConsumerStatefulWidget {
  const RepairScreen({super.key});

  @override
  ConsumerState<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends ConsumerState<RepairScreen> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final orderController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.person_outline)),
            title: const Text("الصيانة"),
            centerTitle: true,
            bottom: TabBar(
                labelColor: AppColors.buttonColor,
                indicatorColor: AppColors.buttonColor,
                tabs: const [
                  Tab(
                    text: "طلب عادي",
                  ),
                  Tab(
                    text: "طلب عاجل",
                  )
                ]),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/img/icons/notification.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                TabBarView(children: [
                  const Column(
                    children: [
                      Text("df"),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              isTextArea: true,
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "ارجو كتابة وصف طلبك";
                                }
                                return null;
                              },
                              controller: orderController,
                              labelName: "يرجي وصف طلبك",
                              hintText: "قم بكتابة وصف طلبك",
                              prefixIcon: const Icon(Icons.email_outlined)),
                          const SizedBox(
                            height: 16,
                          ),
                          TextForm(
                            readOnly: true,
                            labelName: "حدد التاريخ",
                            controller: dateController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "ارجو تحديد التاريخ";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      helpText: "حدد التاريخ",
                                      confirmText: "حدد",
                                      cancelText: "الغاء",
                                      firstDate: DateTime(2024),
                                      initialDate: DateTime.now(),
                                      lastDate: DateTime.now())
                                  .then((pickedDate) {
                                if (pickedDate != null) {
                                  setState(() {
                                    dateController.text =
                                        DateFormat.yMd().format(pickedDate);
                                  });
                                }
                              });
                            },
                            hintText: "قم باختيار التاريخ",
                            suffixIcon: const Icon(Icons.date_range_outlined),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextForm(
                            readOnly: true,
                            labelName: "حدد الوقت",
                            controller: timeController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "ارجو تحديد الوقت";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.datetime,
                            onTap: () {
                              showTimePicker(
                                context: context,
                                helpText: "حدد الوقت",
                                confirmText: "حدد",
                                cancelText: "الغاء",
                                initialTime: TimeOfDay.now(),
                              ).then((pickedTime) {
                                if (pickedTime != null) {
                                  setState(() {
                                    timeController.text =
                                        pickedTime.format(context);
                                  });
                                }
                              });
                            },
                            hintText: "قم باختيار الوقت",
                            suffixIcon: const Icon(Icons.access_time_outlined),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 54),
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text("تاكيد")),
                ),
              ],
            ),
          ),
        ));
  }
}

class AddContainer extends ConsumerWidget {
  const AddContainer({super.key, this.address, this.isSelected = false});
  final Address? address;
  final bool isSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppColors.buttonColor : null,
          borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text("المدينة:"),
                    Text(
                      address?.city ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("المدينة:"),
                    Text(
                      address?.area ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("المدينة:"),
                    Text(
                      address?.city ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  ref
                      .read(goRouterProvider)
                      .push("/add_address", extra: address);
                },
                icon: const Icon(Icons.edit_outlined)),
          ],
        ),
      ),
    );
  }
}
