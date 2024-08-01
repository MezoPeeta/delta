import 'package:delta/src/screens/settings/addresses/providers/address_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  final locationController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  TextEditingController apartmentController = TextEditingController();

  TextEditingController houseController = TextEditingController();

  TextEditingController areaController = TextEditingController();

  String city = "الدوحة";

  @override
  void initState() {
    locationController.text = widget.address?.locationLink ?? "";
    streetController.text = widget.address?.street ?? "";
    houseController.text = widget.address?.flat ?? "";
    city = widget.address?.city ?? "الدوحة";
    areaController.text = widget.address?.city ?? "";
    super.initState();
  }

  final List<String> cities = [
    "الدوحة",
    "الخور",
    "الوكرة",
    "الخوير",
    "الرويس",
    "الريان",
    "رأس لفان",
    "دخان",
    "أم سعيد",
    "أم صلال علي",
    "أم باب",
    "أم صلال محمد",
    "مدينة الشمال",
    "مدينة الزبارة",
  ];

  @override
  Widget build(BuildContext context) {
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
                        items: cities
                            .map((city) => DropdownMenuItem(
                                value: city, child: Text(city)))
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            city = v!;
                          });
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    TextForm(
                      labelName: "المنطقة",
                      controller: areaController,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "ارجو بكتابة اسم المنطقة";
                        }
                        return null;
                      },
                      hintText: "قم بأدخال اسم المنطقة",
                    ),
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
                            readOnly: true,
                            suffixIcon: const Icon(Icons.location_pin),
                            onTap: () async {
                              final location =
                                  await ref.read(getPlacemarkProvider.future);
                              setState(() {
                                locationController.text = location!.street!;
                              });
                            },
                            controller: locationController,
                            validator: (v) {
                              if (v!.isEmpty) {
                                return "ارجو الضغط لكي تضيف عنوانك";
                              }
                              return null;
                            },
                            labelName: "العنوان",
                            hintText: "اضعط لكي تضيف عنوانك",
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                          minWidth: double.infinity, minHeight: 54),
                      child: ElevatedButton(
                          onPressed: () async {
                            final location =
                                await ref.read(getLocationProvider.future);
                            if (formKey.currentState!.validate()) {
                              ref.read(addAddressProvider(
                                  latitude: location.latitude,
                                  longitude: location.longitude,
                                  street: streetController.text,
                                  building: apartmentController.text,
                                  flat: houseController.text,
                                  city: city,
                                  area: areaController.text));
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
