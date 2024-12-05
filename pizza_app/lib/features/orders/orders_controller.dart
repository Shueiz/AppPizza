class OrdersController {
  List<Map<String, dynamic>> orders = [
    {"name": "Pizza Morango", "price": 50.00, "quantity": 1},
    {"name": "Pizza Calabresa", "price": 50.00, "quantity": 1},
    {"name": "Refrigerante", "price": 15.00, "quantity": 1},
  ];

  double getTotal() {
    return orders.fold(
      0,
      (total, item) => total + (item["price"] * item["quantity"]),
    );
  }
}
