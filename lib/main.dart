import 'package:chat_app/settings/theme.dart';
import 'package:chat_app/ui/chat.dart';
import 'package:chat_app/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      theme: ligthTheme(),
      darkTheme: darkTheme(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/", page: () => const Home()),
        GetPage(name: "/chat", page: () => const ChatScreen()),
      ],
    );
  }
}
