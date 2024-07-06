import 'dart:developer';

import 'package:delta/src/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(getNotificationsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإشعارات"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          child: notifications.when(
              data: (data) {
                if (data.isEmpty) {
                  return const EmptyDataWidget(
                    text: "الإشعارات  فارغة!",
                    subText: "لم تقم بتلاقي اي اشعارات  بعد",
                  );
                }
                return ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                    itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].title!),
                              Text(data[index].body!),
                            ],
                          ),
                        ));
              },
              error: (e, s) {
                log("[Error Notification]", error: e, stackTrace: s);
                return const Center(child: Text("حدث خطأ ما"));
              },
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
    required this.text,
    required this.subText,
  });
  final String text;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/img/icons/no_address.svg"),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          subText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
