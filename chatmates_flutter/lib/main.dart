// lib/main.dart

import 'package:flutter/material.dart';

import 'package:chatmates_flutter/Screens/chat_app.dart';
import 'package:chatmates_flutter/Screens/chat_user.dart';
import 'package:chatmates_flutter/Screens/login_screen.dart';
import 'package:chatmates_flutter/Screens/signin_screen.dart';

void main() {
  runApp(const ChatMatesApp());
}

class ChatMatesApp extends StatelessWidget {
  const ChatMatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatMates',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4A90E2),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF4A90E2),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/chat': (context) => const ChatScreen(),
        '/chatuser': (context) => ChatUserHome(),
      },
    );
  }
}
