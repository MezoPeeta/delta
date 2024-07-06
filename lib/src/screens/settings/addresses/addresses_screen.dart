import 'package:delta/src/screens/repair/repair_screen.dart';
import 'package:delta/src/screens/settings/addresses/providers/address_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddressesScreen extends ConsumerStatefulWidget {
  const AddressesScreen({super.key});

  @override
  ConsumerState<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends ConsumerState<AddressesScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final addresses = ref.watch(getUserAddressesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("العناوين"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: addresses.when(
              data: (data) {
                if (data.isEmpty) {
                  return const Column(
                    children: [
                      Expanded(child: EmptyAddress()),
                    ],
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemCount: data.length,
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 16,
                              ),
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  ref
                                      .read(choosenAddressProvider.notifier)
                                      .state = data[index];
                                },
                                child: AddContainer(
                                  isSelected: selectedIndex == index,
                                  address: data[index],
                                ),
                              )),
                    ),
                    selectedIndex != null
                        ? ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 54),
                            child: ElevatedButton(
                                onPressed: () => context.pop(),
                                child: const Text("اختيار العنوان")),
                          )
                        : ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 54),
                            child: ElevatedButton(
                                onPressed: () => context.push("/add_address"),
                                child: const Text("اضافة عنون جديد")),
                          ),
                  ],
                );
              },
              error: (e, s) => const Center(child: Text("حدث خطأ ما")),
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/img/icons/no_address.svg"),
          const Text(
            "العناوين  فارغة!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const Text(
            "لم تقم باضافه اي عنوان  بعد",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 54),
            child: ElevatedButton(
                onPressed: () => context.push("/add_address"),
                child: const Text("اضافة عنوان جديد")),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
