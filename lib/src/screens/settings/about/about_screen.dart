import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  final String email = "sales@deltatechnologys.com";
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
              "شركة دلتا هي شركة متخصصة في تقديم حلول مبتكرة ومتطورة في مجالات التكنولوجيا والخدمات الرقمية. تسعى دلتا دائمًا إلى تمكين الأفراد والشركات من خلال توفير تقنيات حديثة تُسهم في تحسين الكفاءة وزيادة الإنتاجية. من خلال التركيز على الجودة والإبداع، تلتزم دلتا بتقديم أفضل المنتجات والخدمات التي تلبي احتياجات عملائها وتساعدهم على تحقيق أهدافهم بنجاح. سواء كان ذلك من خلال تطوير البرمجيات، تقديم الاستشارات التقنية، أو توفير الحلول الذكية، دلتا دائماً في المقدمة.",
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
            GestureDetector(
              onTap: () async {
                await launchUrlString(
                    'https://www.instagram.com/delta.aelevator/');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: SvgPicture.asset("assets/img/icons/instagram.svg"),
                  title: const Text("انستاجرام"),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () async {
                await launchUrlString(
                    "mailto:$email?subject=تواصل بنا | دلتا&body=");
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: const ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text("البريد الاكتروني"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
