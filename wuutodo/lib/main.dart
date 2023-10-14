import 'package:flutter/material.dart';
import 'package:wuutodo/app/wuu_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: WuuTodo()));
}
