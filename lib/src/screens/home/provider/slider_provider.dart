import 'dart:convert';

import 'package:delta/src/screens/home/data/slider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';

part 'slider_provider.g.dart';

@riverpod
Future<List<Slider>> getSlider(GetSliderRef ref) async {
  final request = await ref.watch(dioHelperProvider).getHTTP("/api/slider/");
  if (request != null) {
    final requestStringJson = request.data.toString();
    final requestJson = jsonDecode(requestStringJson);

    final sliders = requestJson["data"]["photos"]
        .map<Slider>((e) => Slider.fromJson(e))
        .toList();
    return sliders;
  }
  return [];
}
