// main.dart
import 'package:chat_app/Screens/chat_app.dart';
import 'package:chat_app/Screens/chat_user.dart';
import 'package:chat_app/Screens/login_screen.dart';
import 'package:chat_app/Screens/signin_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      theme: ThemeData(
        primaryColor: const Color(0xFF4A90E2),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/chat': (context) => const ChatScreen(),
        '/chatuser': (context) => ChatUserHome(),
      },
    );
  }
}
