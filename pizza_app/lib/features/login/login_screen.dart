import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../../design_system/components/buttons.dart';
import '../../design_system/components/input_fields.dart';
import '../menu/menu_screen.dart';
import './create_account_screen.dart';
import './reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                "Pizzaria\ndo Morro",
                style: AppTextStyles.title.copyWith(
                  fontSize: 40,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              AppInputField(
                hintText: "Email ou telefone",
                controller: emailController,
                prefixIcon: const Icon(Icons.email, color: AppColors.primary),
              ),
              const SizedBox(height: 16),
              AppInputField(
                hintText: "Senha",
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                prefixIcon: const Icon(Icons.lock, color: AppColors.primary),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: AppButtons.primaryButton(
                  "Entrar",
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                  );
                },
                child: Text(
                  "Esqueceu a senha?",
                  style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
                  );
                },
                child: Text(
                  "Criar nova conta",
                  style: AppTextStyles.body.copyWith(color: AppColors.textPrimary),
                ),
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: 120,
                child: AppButtons.secondaryButton(
                  "Menu",
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MenuScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
