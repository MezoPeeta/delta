enum OrderStatus {
  pending(title: "",subTitle:"",description:""),

  ordering(subTitle: "طلب المصعد من المنصع",description:"يتم في هذه الخطوة التواصل مع المصنع و طلب المصعد المطلوب للعميل",title: "المرحلة الاولي"),
  fees(subTitle: "الجمارك",description:"تخليص كل الاوراق الخاصه بالجمارك",title: "المرحلة الثانية"),
  shipping(subTitle: "الشحن",description:"شحن المصعد من المصنع",title: "المرحلة الثالثة"),
  delivering(subTitle: "الوصول للموقع",description:"وصول المصعد للموقع و التجهيز للتركيب",title: "المرحلة الرابعة"),
  installing(subTitle: "تركيب المصعد",description:"البدء في تركيب  المعصد",title: "المرحلة الخامسة"),
  completed(subTitle: "التشغل",description:"البدء في  تشغيل المعصد",title: "المرحلة السادسة"),
  cancelled(title: "",subTitle:"",description:"");

  final String title, subTitle, description;

  const OrderStatus(
      {required this.title,
      required this.subTitle,
      required this.description,
      });

  // String? get readableName {
  //   switch (this) {
  //     case OrderStatus.ordering:
  //       return "طلب المصعد من المنصع";
  //     case OrderStatus.fees:
  //       return "الجمارك";
  //     case OrderStatus.shipping:
  //       return "الشحن";
  //     case OrderStatus.delivering:
  //       return "الوصول للموقع";
  //     case OrderStatus.installing:
  //       return "تركيب المصعد";
  //     case OrderStatus.completed:
  //       return "التشغل";
  //     default:
  //       return null;
  //   }
  // }
}
