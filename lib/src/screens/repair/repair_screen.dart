import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../auth/widgets/text_form.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({super.key});

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  final dateController = TextEditingController();
  final timeController = TextEditingController();

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
                        const AddContainer(),
                        const SizedBox(
                          height: 16,
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                              minWidth: double.infinity, minHeight: 54),
                          child: OutlinedButton(
                              onPressed: () {},
                              child: const Text("اختيار عنوان اخر")),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const TextForm(
                            isTextArea: true,
                            labelName: "يرجي وصف طلبك",
                            hintText: "قم بكتابة وصف طلبك",
                            prefixIcon: Icon(Icons.email_outlined)),
                        const SizedBox(
                          height: 16,
                        ),
                        TextForm(
                          readOnly: true,
                          labelName: "حدد التاريخ",
                          controller: dateController,
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
                ]),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity, minHeight: 54),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("تاكيد")),
                ),
              ],
            ),
          ),
        ));
  }
}

class AddContainer extends StatelessWidget {
  const AddContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("المدينة:"), Text("المنطقة:"), Text("الشارع:")],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        ],
      ),
    );
  }
}
