import 'package:flutter/material.dart';
import 'package:wuutodo/config/config.dart';
import 'package:wuutodo/screens/screens.dart';

class WuuTodo extends StatelessWidget {
  const WuuTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
