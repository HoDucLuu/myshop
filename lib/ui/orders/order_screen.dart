import 'package:flutter/material.dart';
import 'package:myshop/ui/shared/app_drawer.dart';
import 'package:provider/provider.dart';
import 'order_item_cart.dart';
import 'order_manager.dart';

class OrderScreen extends StatelessWidget {
  static const routerName = '/orders';
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('building order');
    final orderManager = OrdersManager();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Order'),
        ),
        drawer: const AppDrawer(),
        body: Consumer<OrdersManager>(
          builder: (ctx, ordersManager, child) {
            return ListView.builder(
              itemCount: orderManager.orderCount,
              itemBuilder: (ctx, i) => OrderItemCart(orderManager.orders[i]),
            );
          },
        ));
  }
}
