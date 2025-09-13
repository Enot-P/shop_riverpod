import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_riverpod/models/product.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  //initial value

  @override
  Set<Product> build() {
    return const {};
  }

  //methods to update state

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(Ref ref) {
  final cartProducts = ref.watch(cartProvider);

  int total = 0;
  total = cartProducts.fold(0, (prev, current) => prev + current.price);

  return total;
}
