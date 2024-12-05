import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../payment/payment_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final orders = orderProvider.orders;
    final total = orders.fold<double>(
      0,
      (previousValue, element) => previousValue + element["price"],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Meus Pedidos", style: AppTextStyles.subtitle),
      ),
      body: orders.isEmpty
          ? const Center(
              child: Text(
                "Nenhum item no pedido.",
                style: AppTextStyles.body,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final item = orders[index];
                      return ListTile(
                        leading: Image.asset(
                          item["image"],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item["name"], style: AppTextStyles.body),
                        subtitle: Text("R\$${item["price"].toStringAsFixed(2)}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            orderProvider.removeOrder(item);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total:", style: AppTextStyles.title),
                      Text("R\$${total.toStringAsFixed(2)}",
                          style: AppTextStyles.title),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(total: total),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text("Ir para Pagamento"),
                ),
              ],
            ),
    );
  }
}
