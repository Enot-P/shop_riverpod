import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_riverpod/providers/cart_notifier.dart';
import 'package:shop_riverpod/providers/products_provider.dart';
import 'package:shop_riverpod/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withAlpha(50),
              child: Column(
                children: [
                  Image.asset(products[index].image, width: 60, height: 60),
                  Text(products[index].title),
                  Text('\$${products[index].price}'),
                  !cartProducts.contains(products[index])
                      ? ElevatedButton(
                          onPressed: () => ref.read(cartNotifierProvider.notifier).addProduct(products[index]),
                          child: const Text('add to cart'),
                        )
                      : ElevatedButton(
                          onPressed: () => ref.read(cartNotifierProvider.notifier).removeProduct(products[index]),
                          child: const Text('remove'),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
