import 'package:delta/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  const ContactList({super.key, required this.phone});
  final String phone;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: OutlinedButton(
          onPressed: () => launchUrlString("tel://${phone.substring(1)}"),
          child: const Text("اتصل بنا")),
      title: const Text(
        "رقم الهاتف",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        child: Icon(
          Icons.phone,
          color: AppColors.buttonColor,
        ),
      ),
    );
  }
}
