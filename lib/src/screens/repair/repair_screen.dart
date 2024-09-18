import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:delta/src/screens/repair/providers/repair_providers.dart';
import 'package:delta/src/screens/settings/addresses/data/address.dart';
import 'package:delta/src/screens/settings/notifications/notifications_screen.dart';
import 'package:delta/src/shared/app_sheet.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../auth/login/login_providers.dart';
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
  final formKey2 = GlobalKey<FormState>();
  List<File> chosenImages = [];
  bool loading = false;
  List<DateTime?> dates = [];
  File? videoFile;
  Future<File> genThumbnailFile(String path) async {
    final fileName = await VideoThumbnail.thumbnailFile(
      video: path,
      thumbnailPath: (await getTemporaryDirectory()).path,
      imageFormat: ImageFormat.JPEG,
      quality: 75,
    );
    File file = File(fileName!);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStorageProvider);
    final isGuest = ref.watch(isGuestProvider);

    return user.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) {
          return const Center(child: Text("حدث خطأ ما"));
        },
        data: (data) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
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
                        onPressed: () {
                          context.push("/notifications");
                        },
                        icon: SvgPicture.asset(
                          "assets/img/icons/notification.svg",
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn),
                        ))
                  ],
                ),
                body: isGuest
                    ? const LoginRequiredWidget()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 20),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            TabBarView(children: [
                              CustomScrollView(
                                slivers: [
                                  SliverToBoxAdapter(
                                    child: Form(
                                      key: formKey2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "العنوان",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.push("/addresses");
                                            },
                                            child: AddContainer(
                                              address: ref.watch(
                                                  choosenAddressProvider),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          ConstrainedBox(
                                            constraints: const BoxConstraints(
                                                minWidth: double.infinity,
                                                minHeight: 54),
                                            child: OutlinedButton(
                                                onPressed: () {
                                                  context.push("/add_address");
                                                },
                                                child:
                                                    const Text("اضافة عنوان")),
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
                                              prefixIcon: const Icon(
                                                  Icons.email_outlined)),
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
                                            keyboardType:
                                                TextInputType.datetime,
                                            onTap: () async {
                                              var result =
                                                  await showCalendarDatePicker2Dialog(
                                                context: context,
                                                config:
                                                    CalendarDatePicker2WithActionButtonsConfig(
                                                        currentDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime.now(),
                                                        allowSameValueSelection:
                                                            true),
                                                dialogSize:
                                                    const Size(325, 400),
                                                value: dates,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              );
                                              if (result != null) {
                                                if (result.first == null)
                                                  return;
                                                setState(() {
                                                  dateController.text =
                                                      "${result.first?.year}/${result.first?.month}/${result.first?.day}";
                                                });
                                              }
                                            },
                                            hintText: "قم باختيار التاريخ",
                                            suffixIcon: const Icon(
                                                Icons.date_range_outlined),
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
                                            keyboardType:
                                                TextInputType.datetime,
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
                                                        pickedTime
                                                            .format(context);
                                                  });
                                                }
                                              });
                                            },
                                            hintText: "قم باختيار الوقت",
                                            suffixIcon: const Icon(
                                                Icons.access_time_outlined),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Text(
                                            "صورة او فديو للعطل ( اختياري )",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  FilePickerResult? result =
                                                      await FilePicker.platform
                                                          .pickFiles(
                                                              allowMultiple:
                                                                  true,
                                                              type: FileType
                                                                  .custom,
                                                              allowedExtensions: [
                                                        "jpg",
                                                        "png",
                                                        "mp4"
                                                      ]);
                                                  if (result == null) return;

                                                  if (result.paths.any((e) =>
                                                      e!.contains("mp4"))) {
                                                    final vid = result.paths
                                                        .where((e) =>
                                                            e!.contains("mp4"))
                                                        .first;

                                                    if (vid != null) {
                                                      File file =
                                                          await genThumbnailFile(
                                                              vid);

                                                      setState(() {
                                                        chosenImages.add(file);
                                                      });
                                                      setState(() {
                                                        videoFile = file;
                                                      });
                                                      print(vid);
                                                    }
                                                  }
                                                  List<File> imgFiles = result
                                                      .paths
                                                      .where((e) =>
                                                          !e!.contains("mp4"))
                                                      .map(
                                                          (path) => File(path!))
                                                      .toList();
                                                  setState(() {
                                                    chosenImages
                                                        .addAll(imgFiles);
                                                  });
                                                },
                                                child: DottedBorder(
                                                  borderType: BorderType.RRect,
                                                  radius:
                                                      const Radius.circular(8),
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    child: const Icon(Icons
                                                        .add_a_photo_outlined),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 60,
                                                  child: ListView.separated(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      shrinkWrap: true,
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const SizedBox(
                                                                width: 12,
                                                              ),
                                                      itemCount:
                                                          chosenImages.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        print(chosenImages[
                                                            index]);
                                                        return Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image: FileImage(
                                                                        chosenImages[
                                                                            index]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                        );
                                                      }),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 100,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "العنوان",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.push("/addresses");
                                        },
                                        child: AddContainer(
                                          address:
                                              ref.watch(choosenAddressProvider),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            minWidth: double.infinity,
                                            minHeight: 54),
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
                                          prefixIcon:
                                              const Icon(Icons.email_outlined)),
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
                                        onTap: () async {
                                          var result =
                                              await showCalendarDatePicker2Dialog(
                                            context: context,
                                            config:
                                                CalendarDatePicker2WithActionButtonsConfig(
                                                    currentDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    allowSameValueSelection:
                                                        true),
                                            dialogSize: const Size(325, 400),
                                            value: dates,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          );
                                          if (result != null) {
                                            if (result.first == null) return;
                                            setState(() {
                                              dateController.text =
                                                  "${result.first?.year}/${result.first?.month}/${result.first?.day}";
                                            });
                                          }
                                        },
                                        hintText: "قم باختيار التاريخ",
                                        suffixIcon: const Icon(
                                            Icons.date_range_outlined),
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
                                        suffixIcon: const Icon(
                                            Icons.access_time_outlined),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Text(
                                        "صورة او فديو للعطل ( اختياري )",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                          allowMultiple: true,
                                                          type: FileType.custom,
                                                          allowedExtensions: [
                                                    "jpg",
                                                    "png",
                                                    "mp4"
                                                  ]);
                                              if (result == null) return;

                                              if (result.paths.any(
                                                  (e) => e!.contains("mp4"))) {
                                                final vid = result.paths
                                                    .where((e) =>
                                                        e!.contains("mp4"))
                                                    .first;

                                                if (vid != null) {
                                                  File file =
                                                      await genThumbnailFile(
                                                          vid);

                                                  setState(() {
                                                    chosenImages.add(file);
                                                  });
                                                  setState(() {
                                                    videoFile = file;
                                                  });
                                                  print(vid);
                                                }
                                              }
                                              List<File> imgFiles = result.paths
                                                  .where((e) =>
                                                      !e!.contains("mp4"))
                                                  .map((path) => File(path!))
                                                  .toList();
                                              setState(() {
                                                chosenImages.addAll(imgFiles);
                                              });
                                            },
                                            child: DottedBorder(
                                              borderType: BorderType.RRect,
                                              radius: const Radius.circular(8),
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: const Icon(
                                                    Icons.add_a_photo_outlined),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 60,
                                              child: ListView.separated(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          const SizedBox(
                                                            width: 12,
                                                          ),
                                                  itemCount:
                                                      chosenImages.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    print(chosenImages[index]);
                                                    return Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: FileImage(
                                                                chosenImages[
                                                                    index]),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                    );
                                                  }),
                                            ),
                                          )
                                        ],
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
                                  onPressed: () async {
                                    final address =
                                        ref.read(choosenAddressProvider);
                                    if (formKey2.currentState == null) {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (formKey.currentState!.validate()) {
                                        await ref.read(
                                            SendMaintenanceRequestProvider(
                                                    photos: chosenImages,
                                                    video:
                                                        videoFile ?? File(""),
                                                    type: "urgent",
                                                    address: address?.id ?? "1",
                                                    description:
                                                        orderController.text,
                                                    date: dateController.text,
                                                    time: timeController.text)
                                                .future);
                                        if (!context.mounted) return;
                                        context.pop();
                                      }
                                      setState(() {
                                        loading = false;
                                      });
                                    }

                                    if (formKey.currentState == null) {
                                      setState(() {
                                        loading = true;
                                      });
                                      if (formKey2.currentState!.validate()) {
                                        await ref.read(
                                            SendMaintenanceRequestProvider(
                                                    photos: chosenImages,
                                                    video:
                                                        videoFile ?? File(""),
                                                    type: "normal",
                                                    address: address?.id ?? "1",
                                                    description:
                                                        orderController.text,
                                                    date: dateController.text,
                                                    time: timeController.text)
                                                .future);
                                        if (!context.mounted) return;
                                        context.pop();
                                      }
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                    if (data!.isUserHasContract) {
                                      appBottomSheet(context,
                                          header: "طلب صيانة",
                                          isRepair: true,
                                          endHeader:
                                              "بكونك عميل مميز و لطلب مصعدك من الدلتا فخدمة الصيانة مجانية لمده سنه",
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
                                                        .read(goRouterProvider)
                                                        .pop();
                                                  },
                                                  child: const Text("التالي")),
                                            ),
                                          ],
                                          subHeader: "عميل مميز");
                                    }
                                  },
                                  child: loading
                                      ? const CircularProgressIndicator
                                          .adaptive(
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        )
                                      : const Text("تاكيد")),
                            ),
                          ],
                        ),
                      ),
              ));
        });
  }
}

class AddContainer extends ConsumerWidget {
  const AddContainer({super.key, this.address, this.isSelected = false});
  final Address? address;
  final bool isSelected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: double.infinity,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(
                width: isSelected ? 2 : 1.0,
                color: isSelected ? AppColors.buttonColor : Colors.black),
            borderRadius: BorderRadius.circular(12)),
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
                    const Text("المنطقة:"),
                    Text(
                      address?.area ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("الشارع:"),
                    Text(
                      address?.street ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  context.push("/add_address", extra: address);
                },
                icon: const Icon(Icons.edit_outlined)),
          ],
        ),
      ),
    );
  }
}
