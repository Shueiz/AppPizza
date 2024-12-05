import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => _orders;

  void addOrder(Map<String, dynamic> item) {
    _orders.add(item);
    notifyListeners(); // Notifica as telas sobre a atualização
  }

  void removeOrder(Map<String, dynamic> item) {
    _orders.remove(item);
    notifyListeners();
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }
}
