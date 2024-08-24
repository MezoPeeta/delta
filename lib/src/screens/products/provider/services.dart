import 'package:flutter_riverpod/flutter_riverpod.dart';

class Services {
  final String title;
  final String icon;
  final String routePath;

  Services({required this.title, required this.icon, required this.routePath});
}

List<Services> _services = [
  Services(
      title: "المنتجات",
      routePath: "/products",
      icon: "assets/img/icons/products_icon.svg"),
  Services(
      title: "صيانة",
      routePath: "/repair",
      icon: "assets/img/icons/repair_icon.svg"),
  Services(
      title: "قسم المبيعات",
      routePath: "/sales",
      icon: "assets/img/icons/sales_icon.svg"),
  Services(
      title: "شكاوي و اقتراحات",
      routePath: "/feedback",
      icon: "assets/img/icons/feedback_icon.svg"),
  Services(
      title: "حول الشركة",
      routePath: "/about",
      icon: "assets/img/icons/about_icon.svg"),
];

final servicesProvider = StateProvider<List<Services>>((ref) => _services);
