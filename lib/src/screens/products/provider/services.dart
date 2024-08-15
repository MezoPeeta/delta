import 'package:flutter_riverpod/flutter_riverpod.dart';

class Services {
  final String title;
  final String? photo;
  final String routePath;

  Services({required this.title, this.photo, required this.routePath});
}

List<Services> _services = [
  Services(title: "المنتجات", routePath: "/products"),
  Services(title: "صيانة", routePath: "/repair"),
  Services(title: "تركيبات", routePath: ""),
  Services(title: "شكاوي و اقتراحات", routePath: "/feedback"),
];

final servicesProvider = StateProvider<List<Services>>((ref) => _services);
