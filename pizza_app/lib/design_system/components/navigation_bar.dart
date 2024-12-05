import 'package:flutter/material.dart';
import '../colors.dart';

class AppNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textPrimary.withOpacity(0.5),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}
