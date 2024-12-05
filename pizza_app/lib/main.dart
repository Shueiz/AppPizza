import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/providers/order_provider.dart';
import 'features/providers/user_provider.dart';
import 'features/login/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()), // Gerencia pedidos
        ChangeNotifierProvider(create: (_) => UserProvider()),  // Gerencia dados do usuário
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizzaria do Morro',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LoginScreen(), // Tela inicial do aplicativo
    );
  }
}
