import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../shared/dialog_utils.dart';

class CartItemCart extends StatelessWidget {
  final String productId;
  final CartItem cartitem;

  const CartItemCart({
    required this.productId,
    required this.cartitem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartitem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Do you want to remove the item from the cart?',
        );
      },
      onDismissed: ((direction) {
        print('cart item dismissed');
      }),
      child: buidItemCart(),
    );
  }

  Widget buidItemCart() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${cartitem.price}'),
              ),
            ),
          ),
          title: Text(cartitem.title),
          subtitle: Text('Total: \$${(cartitem.price * cartitem.quantity)}'),
          trailing: Text('${cartitem.quantity} x'),
        ),
      ),
    );
  }
}
