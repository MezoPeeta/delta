import 'package:delta/src/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../styles/colors.dart';
import '../bookings/data/order.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key, required this.order});
  final Order order;
  @override
  Widget build(BuildContext context) {
    final isContractDone = order.contractStages.toLowerCase() == "signature";
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("طلب رقم: ${order.id}"),
            centerTitle: true,
            bottom: TabBar(
                labelColor: AppColors.buttonColor,
                indicatorColor: AppColors.buttonColor,
                tabs: const [
                  Tab(
                    text: "توقيع العقد",
                  ),
                  Tab(
                    text: "مراحل التنفيذ",
                  )
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            child: TabBarView(children: [
              SizedBox(
                child: PendingApprovalContract(
                  svgImage: "assets/img/icons/contract.svg",
                  approved: isContractDone,
                ),
              ),
              SizedBox(
                  child: isContractDone
                      ? OrderScreen(order: order)
                      : const PendingApprovalContract(
                          svgImage: "assets/img/icons/no_address.svg",
                        ))
            ]),
          )),
    );
  }
}

class PendingApprovalContract extends StatelessWidget {
  const PendingApprovalContract({
    super.key,
    required this.svgImage,
    this.approved = false,
  });

  final String svgImage;
  final bool approved;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgImage),
        const SizedBox(
          height: 24,
        ),
        Text(
          approved ? "لقد تم الموافقه علي المنتج" : "تم تقديم الطلب بالفعل",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          approved
              ? "لقد قمت بتقديم طلب بالفعل و لقد تم الموافقه عليه يمكنك الان مشاهده و معرفه تفاصيل منتجاتك و شكرا لاستخدامك تطبيق الدلتا"
              : "لقد قمت بتقديم طلب بالفعل و سيتم الرد عليك خلال 48 ساعه لمعرفه كافة التفاصيل و شكرا لاستخدامك تطبيق الدلتا",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        Visibility(
          visible: !approved,
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 54),
            child: ElevatedButton(
                onPressed: () {
                  context.push('/sales');
                },
                child: const Text("التواصل مع قسم المبيعات")),
          ),
        ),
      ],
    );
  }
}
