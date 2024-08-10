import 'package:delta/src/shared/cache_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscountNotifier extends Notifier<bool> {
  @override
  bool build() {
    final cache = CacheHelper.getBool("isFirstTimeDiscount") ?? true;
    return cache;
  }

  void toggle(bool value) async {
    state = value;
    CacheHelper.setBool("isFirstTimeDiscount", value: value);
  }
}

final checkDiscountProvider =
    NotifierProvider<DiscountNotifier, bool>(DiscountNotifier.new);
