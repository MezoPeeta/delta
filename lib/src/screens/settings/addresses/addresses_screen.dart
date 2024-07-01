import 'package:delta/src/screens/repair/repair_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("العناوين"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            const AddContainer(),
            const SizedBox(
              height: 16,
            ),
            const AddContainer(),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("اضافة عنون جديد")),
            ),
          ],
        ),
      ),
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
