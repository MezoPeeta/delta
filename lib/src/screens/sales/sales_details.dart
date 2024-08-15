import 'package:delta/src/screens/settings/contact/contact_screen.dart';
import 'package:delta/src/shared/app_bar.dart';
import 'package:flutter/material.dart';

import 'data/sales.dart';

class SalesDetails extends StatelessWidget {
  const SalesDetails({super.key, required this.person});
  final Sales person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: person.name,
          isSettings: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "معلومات التواصل",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 8,
              ),
              ContactList(phone: person.mobilePhone),
              ContactList(
                phone: person.whatsapp,
                isWhatsApp: true,
              )
            ],
          ),
        ));
  }
}
