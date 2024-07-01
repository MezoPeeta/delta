import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/widgets/text_form.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اضافة عنوان"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const TextForm(
              labelName: "الشارع",
              hintText: "قم بأدخال اسم الشارع",
            ),
            const SizedBox(
              height: 16,
            ),
            const TextForm(
              labelName: "المبني",
              hintText: "قم بأدخال رقم المبني",
            ),
            const SizedBox(
              height: 16,
            ),
            const TextForm(
              labelName: "الشقة",
              hintText: "قم بأدخل رقم الشقة",
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: TextForm(
                    labelName: "خط العرض",
                    hintText: "خط العرض",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Expanded(
                  child: TextForm(
                    labelName: "خط الطول",
                    hintText: "خط الطول",
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: SvgPicture.asset("assets/img/icons/google_map.svg"),
                  ),
                )
              ],
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, minHeight: 54),
              child: ElevatedButton(onPressed: () {}, child: const Text("حفظ")),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
