import 'package:delta/src/screens/bookings/bookings_screen.dart';
import 'package:delta/src/screens/settings/addresses/providers/address_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  TextEditingController areaController = TextEditingController();

  String city = "الدوحة";

  @override
  void initState() {
    locationController.text = widget.address?.locationLink ?? "";
    streetController.text = widget.address?.street ?? "";
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

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة عنوان"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(minWidth: double.infinity, minHeight: 54),
          child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                if (formKey.currentState!.validate()) {
                  final location = await ref.read(getLocationProvider.future);
                  await ref.read(addAddressProvider(
                          latitude: location.latitude,
                          longitude: location.longitude,
                          street: streetController.text,
                          building: apartmentController.text,
                          flat: "test",
                          city: city,
                          area: areaController.text)
                      .future);
                }
                setState(() {
                  loading = false;
                });
                ref.invalidate(getUserAddressesProvider);
                context.pop();
              },
              child: loading
                  ? const CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : const Text("حفظ")),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                        .map((city) =>
                            DropdownMenuItem(value: city, child: Text(city)))
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
                  labelName: "رقم المنطقة",
                  controller: areaController,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "ارجو بكتابة رقم المنطقة";
                    }
                    return null;
                  },
                  hintText: "قم بأدخال رقم المنطقة",
                ),
                const SizedBox(
                  height: 8,
                ),
                TextForm(
                  labelName: "رقم الشارع",
                  controller: streetController,
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "ارجو بكتابة رقم الشارع";
                    }
                    return null;
                  },
                  hintText: "قم بأدخال رقم الشارع",
                ),
                const SizedBox(
                  height: 16,
                ),
                TextForm(
                  controller: apartmentController,
                  keyboardType: TextInputType.number,
                  labelName: "رقم المبني",
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
                      return "ارجو الضغط لكي تضيف لوكيشن";
                    }
                    return null;
                  },
                  labelName: "اللوكيشن",
                  hintText: "اضعط لكي تضيف لوكيشن",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
