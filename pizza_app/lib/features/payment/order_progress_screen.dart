import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../menu/menu_screen.dart';

class OrderProgressScreen extends StatefulWidget {
  const OrderProgressScreen({super.key});

  @override
  _OrderProgressScreenState createState() => _OrderProgressScreenState();
}

class _OrderProgressScreenState extends State<OrderProgressScreen> {
  int _stepIndex = 0;
  final List<String> steps = [
    "Preparando o Pedido",
    "Pedido em Rota de Entrega",
    "Pedido Entregue",
  ];

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() async {
    for (int i = 0; i < steps.length; i++) {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        setState(() {
          _stepIndex = i;
        });
      }
    }

    // Redireciona para o menu após a animação
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MenuScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Progresso do Pedido", style: AppTextStyles.subtitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _stepIndex == 2
                  ? Icons.check_circle
                  : Icons.delivery_dining,
              color: AppColors.primary,
              size: 100,
            ),
            const SizedBox(height: 24),
            Text(
              steps[_stepIndex],
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "Aguarde enquanto atualizamos o status do seu pedido.",
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
