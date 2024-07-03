import 'package:delta/src/screens/settings/addresses/providers/address_providers.dart';
import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../../auth/widgets/text_form.dart';
import 'data/address.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen(this.address, {super.key});
  final Address? address;
  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final streetController =
        TextEditingController(text: widget.address?.street);

    final apartmentController =
        TextEditingController(text: widget.address?.building);

    final houseController = TextEditingController(text: widget.address?.flat);

    final latitiudeController =
        TextEditingController(text: widget.address?.latitude.toString());

    final longitudeController =
        TextEditingController(text: widget.address?.longitude.toString());
    String city = widget.address?.city ?? "النص";
    String area = widget.address?.area ?? "النص";
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة عنوان"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "المدينة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                        hint: const Text("اختار مدينتك"),
                        value: city,
                        items: const [
                          DropdownMenuItem(
                            value: "النص",
                            child: Text("1"),
                          ),
                          DropdownMenuItem(
                            value: "sd",
                            child: Text("2"),
                          ),
                        ],
                        onChanged: (v) {
                          setState(() {
                            city = v!;
                          });
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "المنطقة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                        hint: const Text("اختار منطقتك"),
                        value: area,
                        items: const [
                          DropdownMenuItem(
                            value: "النص",
                            child: Text("النص"),
                          ),
                          DropdownMenuItem(
                            value: "نص2",
                            child: Text("2النص"),
                          ),
                        ],
                        onChanged: (v) {
                          setState(() {
                            area = v!;
                          });
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    TextForm(
                      labelName: "الشارع",
                      controller: streetController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "ارجو بكتابة اسم الشارع";
                        }
                        return null;
                      },
                      hintText: "قم بأدخال اسم الشارع",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextForm(
                      controller: apartmentController,
                      labelName: "المبني",
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "ارجو بكتابة رقم المبني";
                        }
                        return null;
                      },
                      hintText: "قم بأدخال رقم المبني",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextForm(
                      controller: houseController,
                      labelName: "الشقة",
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "ارجو بكتابة رقم الشقة";
                        }
                        return null;
                      },
                      hintText: "قم بأدخل رقم الشقة",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextForm(
                            controller: latitiudeController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "ارجو بكتابة خط العرض";
                              }
                              return null;
                            },
                            labelName: "خط العرض",
                            hintText: "خط العرض",
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: TextForm(
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "ارجو بكتابة خط الطول";
                              }
                              return null;
                            },
                            controller: longitudeController,
                            labelName: "خط الطول",
                            hintText: "خط الطول",
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(getLocationProvider.future)
                                  .then((Position location) {
                                setState(() {
                                  latitiudeController.text =
                                      location.latitude.toString();
                                  longitudeController.text =
                                      location.longitude.toString();
                                });
                              });
                            },
                            child: Container(
                              height: 55,
                              padding: const EdgeInsets.all(12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.buttonColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: SvgPicture.asset(
                                  "assets/img/icons/google_map.svg"),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: double.infinity, minHeight: 54),
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref.read(addAddressProvider(
                                  latitude:
                                      double.parse(latitiudeController.text),
                                  longitude:
                                      double.parse(longitudeController.text),
                                  street: streetController.text,
                                  building: apartmentController.text,
                                  flat: houseController.text,
                                  city: city,
                                  area: area));
                            }
                          },
                          child: const Text("حفظ")),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
