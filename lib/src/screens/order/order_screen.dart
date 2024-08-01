import 'package:collection/collection.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/screens/order/data/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../styles/colors.dart';
import '../auth/login/login_providers.dart';
import '../bookings/data/order.dart';
import '../products/product_detail.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({
    super.key,
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStorageProvider).requireValue;
    return Scaffold(
      appBar: AppBar(
        title: Text("رقم طلب: ${order.id}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "مراحل التنفيذ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              ...OrderStatus.values.mapIndexed((i, e) {
                bool isActive = OrderStatus.values.indexOf(OrderStatus.values
                        .firstWhere(
                            (e) => e.name == order.status.toLowerCase())) >=
                    i;
                if (e.title.isEmpty) {
                  return const SizedBox.shrink();
                }
                return OrderStateItem(
                    backgroundColor: AppColors.doneColor,
                    icon: isActive ? Icons.check : Icons.arrow_back,
                    iconColor: Colors.white,
                    title: e.title,
                    isActive: isActive,
                    subTitle: e.subTitle,
                    description: e.description,
                    isFinalStep: e.name == "completed",
                    clarifyTextColor:
                        isActive ? AppColors.doneColor : AppColors.grayColor,
                    clarifyText: isActive ? "اكتمل" : "قيد الانتظار");
              }),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "معلومات المنتج",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.only(right: 10, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "الاسم:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          user!.name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "رقم الهاتف:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          user.phone,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "رقم الطلب:",
                              style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              order.id,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                  ClipboardData(text: order.id));
                            },
                            icon: const Icon(Icons.copy))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "العقد:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            ref.read(downloadPDFProvider(userID: user.id));
                          },
                          label: const Text(
                            "تنزيل",
                            textAlign: TextAlign.center,
                          ),
                          iconAlignment: IconAlignment.end,
                          icon: const Icon(
                            Icons.download,
                          ),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الحالة:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          color: const Color(0xFFFAEBDE),
                          child: const Text("تم دفع جزئ من المبلغ"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "طلباتك",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: order.cartItems
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SmallProductContainer(product: e.product),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStateItem extends StatelessWidget {
  const OrderStateItem(
      {super.key,
      required this.backgroundColor,
      required this.icon,
      required this.iconColor,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.clarifyTextColor,
      required this.clarifyText,
      this.isActive = false,
      this.isFinalStep = false});

  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subTitle;
  final String description;
  final Color clarifyTextColor;
  final String clarifyText;
  final bool isActive, isFinalStep;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                  color: !isActive ? Colors.white : backgroundColor,
                  border: !isActive ? Border.all() : null,
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                icon,
                color: !isActive ? AppColors.grayColor : iconColor,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 12, color: AppColors.grayColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      description,
                      style:
                          TextStyle(fontSize: 12, color: AppColors.grayColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                        height: 55,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: !isActive
                                ? AppColors.grayColor.withOpacity(0.05)
                                : clarifyTextColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          !isActive ? "قيد الانتظار" : clarifyText,
                          style: TextStyle(
                              color: !isActive
                                  ? AppColors.grayColor
                                  : clarifyTextColor),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: !isFinalStep,
          child: Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomPaint(
                painter: Line(
                    color: !isActive ? AppColors.grayColor : backgroundColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Line extends CustomPainter {
  Line({this.color = Colors.black});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0, 34),
        const Offset(0, 170),
        Paint()
          ..strokeWidth = 2
          ..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
