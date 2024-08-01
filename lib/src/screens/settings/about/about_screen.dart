import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("حول الشركة"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "من نحن",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ReadMoreText(
              'وصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصفوصsdsdsdsdsdsdsdsdsdssdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddفوصفوصفوصفوصفوصفوص.',
              trimMode: TrimMode.Line,
              trimLines: 5,
              style: TextStyle(color: AppColors.grayColor),
              trimCollapsedText: 'قراءة المزيد',
              trimExpandedText: 'قراءة القليل',
              colorClickableText: AppColors.linkColor,
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.linkColor,
                  color: AppColors.linkColor),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "تواصل معنا",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: SvgPicture.asset("assets/img/icons/whatsapp.svg"),
                title: const Text("واتساب"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: SvgPicture.asset("assets/img/icons/facebook.svg"),
                title: const Text("فيسبوك"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: SvgPicture.asset("assets/img/icons/instagram.svg"),
                title: const Text("انستاجرام"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: SvgPicture.asset("assets/img/icons/twitter.svg"),
                title: const Text("تويتر (اكس)"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: ()=>context.push("/contact"),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("اتصل بنا"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
