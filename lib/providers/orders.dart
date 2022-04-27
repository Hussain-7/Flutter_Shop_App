import 'package:flutter/foundation.dart';

import './cart.dart';

class OrderItemClass {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItemClass({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItemClass> _orders = [];

  List<OrderItemClass> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItemClass(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
