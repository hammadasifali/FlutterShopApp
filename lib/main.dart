import 'package:flutter/material.dart';
import 'package:my_shop/cart_provider.dart';
import 'package:my_shop/login_page.dart';
import 'package:my_shop/logout.dart';
import 'package:my_shop/mainpage.dart';
import 'package:my_shop/welcoming_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          prefixIconColor: Color.fromRGBO(
            119,
            119,
            119,
            1,
          ),
        ),
      ),
      home: const WelcomingPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/mainPage': (context) => const MainPage(),
        '/logout': (context) => const LogoutPage(),
      },
    );
  }
}
