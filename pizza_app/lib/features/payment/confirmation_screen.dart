import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/components/buttons.dart';
import '../../design_system/text_styles.dart';
import 'order_progress_screen.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Confirmação", style: AppTextStyles.subtitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: AppColors.primary, size: 100),
            const SizedBox(height: 24),
            const Text(
              "Pagamento Confirmado!",
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "Seu pedido foi realizado com sucesso.",
              style: AppTextStyles.body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppButtons.primaryButton("Acompanhar Pedido", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderProgressScreen()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
