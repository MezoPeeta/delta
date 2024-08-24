import 'package:delta/src/screens/bookings/data/order.dart';
import 'package:delta/src/screens/discount/providers/orders_providers.dart';
import 'package:delta/src/screens/products/provider/product_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<List<CartItem>> build() async {
    final data = await ref.watch(getCartProvider.future);
    return data;
  }

  Future<void> addToCart({required String productID}) async {
    state = const AsyncLoading();
    final data = ref.watch(addToCartProvider(productID: productID).future);
    state = await AsyncValue.guard(() => data);
  }

  Future<void> deleteFromCart({required String productID}) async {
    state = const AsyncLoading();
    final data = ref.watch(deleteFromCartProvider(productID: productID).future);
    state = await AsyncValue.guard(() => data);
  }
}
