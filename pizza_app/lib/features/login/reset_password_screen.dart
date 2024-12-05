import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/buttons.dart';
import '../../design_system/components/input_fields.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Redefinir Senha", style: AppTextStyles.subtitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                "Informe o email associado à sua conta. Enviaremos um link para redefinir sua senha.",
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              AppInputField(
                hintText: "Email",
                controller: emailController,
                prefixIcon: const Icon(Icons.email, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              AppButtons.primaryButton("Enviar Link", () {
                // Lógica para envio de email
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Link enviado para o email!")),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
