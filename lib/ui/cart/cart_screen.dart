import 'package:flutter/material.dart';
import 'package:myshop/ui/orders/order_manager.dart';
import 'cart_item_cart.dart';
import 'cart_manager.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your You'),
      ),
      body: Column(
        children: <Widget>[
          buildCartSummary(cart, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: buildCartDetails(cart)),
        ],
      ),
    );
  }

  Widget buildCartSummary(CartManager cartManager, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '\$${cartManager.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            TextButton(
              onPressed: cartManager.totalAmount <= 0
                  ? null
                  : () {
                      context.read<OrdersManager>().addOrder(
                          cartManager.products, cartManager.totalAmount);
                      cartManager.clear();
                    },
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('ORDER NOW'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCartDetails(CartManager cartManager) {
    return ListView(
      children: cartManager.productEntries
          .map((e) => CartItemCart(productId: e.key, cartitem: e.value))
          .toList(),
    );
  }
}
