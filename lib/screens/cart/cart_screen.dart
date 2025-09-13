import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_riverpod/providers/cart_notifier.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        spacing: 10,
                        children: [
                          Image.asset(p.image, width: 60, height: 60),
                          Text(p.title),
                          const Expanded(child: SizedBox()),
                          Text('\$${p.price}'),
                        ],
                      ),
                    ),
                  )
                  .toList(), // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
