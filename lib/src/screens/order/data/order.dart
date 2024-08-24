enum OrderStatus {
  pending(title: "", subTitle: "", description: ""),

  ordering(
      subTitle: "طلب المصعد من المنصع",
      description:
          "يتم في هذه الخطوة التواصل مع المصنع و طلب المصعد المطلوب للعميل",
      title: "المرحلة الاولي"),
  shipping(
      subTitle: "الشحن",
      description: "شحن المصعد من المصنع",
      title: "المرحلة الثانية"),
  fees(
      subTitle: "الجمارك",
      description: "تخليص كل الاوراق الخاصه بالجمارك",
      title: "المرحلة الثالثة"),
  delivering(
      subTitle: "الوصول للموقع",
      description: "وصول المصعد للموقع و التجهيز للتركيب",
      title: "المرحلة الرابعة"),
  installing(
      subTitle: "تركيب الميكانيكا",
      description: "البدء في تركيب  الميكانيكا",
      title: "المرحلة الخامسة"),
  continuee(
      subTitle: "توصيل الكهرباء و تشغيل المصعد",
      description: "",
      title: "المرحلة السادسة"),
  completed(
      title: "المرحلة السابعة", subTitle: "تسليم المصعد", description: ""),
  cancelled(title: "", subTitle: "", description: "");

  final String title, subTitle, description;

  const OrderStatus({
    required this.title,
    required this.subTitle,
    required this.description,
  });
}
