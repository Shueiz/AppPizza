import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/buttons.dart';
import 'confirmation_screen.dart';
import 'add_card_screen.dart';

class PaymentScreen extends StatelessWidget {
  final double total;

  const PaymentScreen({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    final List<String> paymentMethods = ["Visa", "Mastercard", "Pix"];
    String selectedMethod = "Visa";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Pagamento", style: AppTextStyles.subtitle),
      ),
      body: StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Métodos de Pagamento:", style: AppTextStyles.title),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      final method = paymentMethods[index];
                      return ListTile(
                        leading: const Icon(Icons.credit_card, color: AppColors.primary),
                        title: Text(method, style: AppTextStyles.body),
                        trailing: Radio<String>(
                          value: method,
                          groupValue: selectedMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedMethod = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddCardScreen()),
                    );
                  },
                  child: const Text("Adicionar Novo Cartão", style: AppTextStyles.body),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:", style: AppTextStyles.title),
                    Text("R\$${total.toStringAsFixed(2)}",
                        style: AppTextStyles.title),
                  ],
                ),
                const SizedBox(height: 16),
                AppButtons.primaryButton("Confirmar Pagamento", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationScreen(),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
