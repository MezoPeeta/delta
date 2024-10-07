import 'dart:convert';
import 'dart:developer';

import 'package:delta/src/screens/home/data/slider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio_helper.dart';
import 'package:http/http.dart' as http;
part 'slider_provider.g.dart';

@riverpod
Future<Slider> getSlider(GetSliderRef ref) async {
  final url = Uri.parse("https://api.delta-for-elmvators.me/api/slider/");
  final request = await http.get(url);
  log(request.body);

  return Slider.fromJson(jsonDecode(request.body));
}
