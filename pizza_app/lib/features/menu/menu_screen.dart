import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/navigation_bar.dart';
import '../orders/orders_screen.dart';
import '../profile/profile_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  // Listas de itens por categoria
  final List<Map<String, dynamic>> pizzas = [
    {"name": "Calabresa", "price": 50.00, "image": "assets/images/pizza_calabresa.jpg"},
    {"name": "Frango com Catupiry", "price": 55.00, "image": "assets/images/pizza_frango.jpg"},
    {"name": "Quatro Queijos", "price": 60.00, "image": "assets/images/pizza_queijo.jpg"},
  ];

  final List<Map<String, dynamic>> doces = [
    {"name": "Chocolate", "price": 35.00, "image": "assets/images/pizza_chocolate.jpg"},
    {"name": "Morango com Leite Condensado", "price": 40.00, "image": "assets/images/pizza_morango.jpg"},
  ];

  final List<Map<String, dynamic>> bebidas = [
    {"name": "Coca-Cola", "price": 15.00, "image": "assets/images/coca_cola.jpg"},
    {"name": "Suco de Laranja", "price": 10.00, "image": "assets/images/suco_laranja.jpg"},
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 2) { // Perfil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 1) { // Pedidos
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OrdersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Pizzaria do Morro", style: AppTextStyles.subtitle),
      ),
      body: ListView(
        children: [
          buildCategory("Pizzas", pizzas),
          buildCategory("Doces", doces),
          buildCategory("Bebidas", bebidas),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget buildCategory(String title, List<Map<String, dynamic>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title, style: AppTextStyles.title),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                      child: Image.asset(
                        item["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          item["name"],
                          style: AppTextStyles.body,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "R\$${item["price"].toStringAsFixed(2)}",
                          style: AppTextStyles.body,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<OrderProvider>(context, listen: false).addOrder(item);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${item["name"]} adicionado ao pedido!")),
                            );
                          },
                          child: const Text("Adicionar ao Pedido"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
