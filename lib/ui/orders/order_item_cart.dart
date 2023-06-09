import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/order_item.dart';

class OrderItemCart extends StatefulWidget {
  final OrderItem order;

  const OrderItemCart(this.order, {super.key});

  @override
  State<OrderItemCart> createState() => _OrderItemCartState();
}

class _OrderItemCartState extends State<OrderItemCart> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildOrderSumary(),
          if (_expanded) buildOrderDetails()
        ],
      ),
    );
  }

  Widget buildOrderDetails() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      height: min(widget.order.productCount * 20.0 + 10, 100),
      child: ListView(
        children: widget.order.products
            .map((prop) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      prop.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${prop.quantity} x \$${prop.price}',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }

  Widget buildOrderSumary() {
    return ListTile(
      title: Text('\$${widget.order.amount}'),
      subtitle: Text(
        DateFormat('dd/MM/YYYY hh:mm').format(widget.order.dateTime),
      ),
      trailing: IconButton(
        icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
        onPressed: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}
