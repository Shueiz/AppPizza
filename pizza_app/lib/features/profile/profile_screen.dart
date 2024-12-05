import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/text_styles.dart';
import '../login/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar saída"),
          content: const Text("Você realmente deseja sair?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text("Sair"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Perfil", style: AppTextStyles.subtitle),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "M",
                    style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
                  ),
                ),
                const SizedBox(width: 16),
                const Text("Olá, Matheus", style: AppTextStyles.body),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.primary),
            title: const Text("Início"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag, color: AppColors.primary),
            title: Text("Meus Pedidos"),
          ),
          const ListTile(
            leading: Icon(Icons.history, color: AppColors.primary),
            title: Text("Histórico de Pedidos"),
          ),
          const ListTile(
            leading: Icon(Icons.star, color: AppColors.primary),
            title: Text("Favoritos"),
          ),
          const ListTile(
            leading: Icon(Icons.support, color: AppColors.primary),
            title: Text("Suporte"),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: AppColors.primary),
            title: Text("Configurações"),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("Sair"),
            onTap: () {
              _confirmLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
