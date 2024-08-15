import 'package:delta/src/screens/home/data/slider.dart';
import 'package:delta/src/shared/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';

part 'slider_provider.g.dart';

@riverpod
Future<List<Slider>> getSlider(GetSliderRef ref) async {
  final token = await ref.watch(tokenProvider.future);
  final request = await ref
      .watch(dioHelperProvider)
      .getHTTP("/api/slider/", token: token ?? "");

  final List<Slider> sliders = request!.data["data"]["photos"]
      .map<Slider>((e) => Slider.fromJson(e))
      .toList();
  return sliders;
}
