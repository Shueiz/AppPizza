import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/buttons.dart';
import '../../design_system/components/input_fields.dart';
import '../login/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Criar Conta", style: AppTextStyles.subtitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppInputField(
                hintText: "Nome Completo",
                controller: nameController,
                prefixIcon: const Icon(Icons.person, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              AppInputField(
                hintText: "Email",
                controller: emailController,
                prefixIcon: const Icon(Icons.email, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              AppInputField(
                hintText: "Senha",
                controller: passwordController,
                obscureText: true,
                prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
                suffixIcon: const Icon(Icons.visibility, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              AppButtons.primaryButton("Criar Conta", () {
                // Apenas redireciona para a tela de login
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Conta criada com sucesso!")),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
