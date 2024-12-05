import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/buttons.dart';
import '../../design_system/components/input_fields.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expirationDateController = TextEditingController();
    final TextEditingController cvcController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Adicionar Cartão", style: AppTextStyles.subtitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              AppInputField(
                hintText: "Número do Cartão",
                controller: cardNumberController,
                prefixIcon: const Icon(Icons.credit_card, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              AppInputField(
                hintText: "Data de Expiração (MM/AA)",
                controller: expirationDateController,
                prefixIcon: const Icon(Icons.date_range, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              AppInputField(
                hintText: "CVC",
                controller: cvcController,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              AppButtons.primaryButton("Salvar Cartão", () {
                // Lógica para salvar o cartão
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cartão salvo com sucesso!")),
                );
                Navigator.pop(context); // Voltar à tela de pagamento
              }),
            ],
          ),
        ),
      ),
    );
  }
}
