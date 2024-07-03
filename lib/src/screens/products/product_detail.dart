import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../styles/colors.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("المنتج"),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.red),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "اسم المنتج",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "الوصف",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
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
                  height: 8,
                ),
                const Text(
                  "منتجات ذات صلة:",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                const SmallProductContainer()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SmallProductContainer extends StatelessWidget {
  const SmallProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(),
          color: AppColors.grayColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
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
      ),
    );
  }
}
