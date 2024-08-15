import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اتصل بنا"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          ContactList(
            phone: "+971111111111",
          )
        ],
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.phone, this.isWhatsApp = false});
  final String phone;
  final bool isWhatsApp;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: OutlinedButton(
          onPressed: () => isWhatsApp
              ? launchUrlString("http://wa.me/$phone")
              : launchUrlString("tel://${phone.substring(1)}"),
          child: Text(isWhatsApp ? "تواصل مع البائع " : "اتصل بنا")),
      title: Text(
        isWhatsApp ? "رقم الواتساب" : "رقم الهاتف",
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            phone,
            textAlign: TextAlign.end,
          )),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.buttonColor.withOpacity(0.2)),
        child: isWhatsApp
            ? Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 40,
                  child: SvgPicture.asset(
                    "assets/img/icons/whatsapp.svg",
                    colorFilter: ColorFilter.mode(
                        AppColors.buttonColor, BlendMode.srcIn),
                  ),
                ),
              )
            : Icon(
                Icons.phone,
                color: AppColors.buttonColor,
              ),
      ),
    );
  }
}
