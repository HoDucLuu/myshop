import 'package:flutter/material.dart';
import 'order_item_cart.dart';
import 'order_manager.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building order');
    final orderManager = OrdersManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order'),
      ),
      body: ListView.builder(
          itemCount: orderManager.orderCount,
          itemBuilder: (ctx, i) => OrderItemCart(orderManager.orders[i])),
    );
  }
}
