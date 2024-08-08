import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/category.dart';

const List<Category> _services = [
  Category(title: "المنتجات"),
  Category(title: "صيانة", photo: "assets/img/icons/ma2bd.svg"),
  Category(title: "تركيبات", photo: "assets/img/icons/sa2f_ms3d.svg"),
  Category(title: "شكاوي و اقتراحات", photo: "assets/img/icons/ardya_ms3d.svg"),
];

final servicesProvider = StateProvider<List<Category>>((ref) => _services);
