import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("طلب رقم: 4"),
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
              OrderStateItem(
                  backgroundColor: AppColors.doneColor,
                  icon: Icons.check,
                  isActive: true,
                  iconColor: Colors.white,
                  title: "المرحلة الاولي",
                  subTitle: "طلب المصعد من المنصع",
                  description:
                      "يتم في هذه الخطوة التواصل مع المصنع و طلب المصعد المطلوب للعميل",
                  clarifyTextColor: AppColors.doneColor,
                  clarifyText: "اكتمل"),
              const OrderStateItem(
                  backgroundColor: Color(0xFF343434),
                  icon: Icons.arrow_back,
                  isActive: true,
                  iconColor: Colors.white,
                  title: "المرحلة التانية",
                  subTitle: "الشحن و الجمارك",
                  description:
                      "تخليص كل الاوراق الخاصه بالجمارك و شحن المصعد من المصنع",
                  clarifyTextColor: Color(0xFF343434),
                  clarifyText: "جاري التنفيذ"),
              const OrderStateItem(
                  backgroundColor: Color(0xFF343434),
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  title: "المرحلة التانية",
                  subTitle: "الشحن و الجمارك",
                  description:
                      "تخليص كل الاوراق الخاصه بالجمارك و شحن المصعد من المصنع",
                  clarifyTextColor: Color(0xFF343434),
                  clarifyText: "جاري التنفيذ"),
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
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "الاسم:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
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
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "التاريخ:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "الدفعة الاولي:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "الدفعة الثانية:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Text(
                          "الدفعة الثالثة:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
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
                              "رثم الطلب:",
                              style: TextStyle(
                                  color: AppColors.grayColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              "456456",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.copy))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "العفد:",
                          style: TextStyle(
                              color: AppColors.grayColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
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
                        const Text(
                          "احمد حسام الموكوس",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: AppColors.grayColor,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          children: [
                            const Text("الاسم"),
                            Text(
                              "الوصف",
                              style: TextStyle(color: AppColors.grayColor),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
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
