import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wuutodo/providers/providers.dart';

import '../../data/repositories/todo_repository_provider.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return TodoNotifier(repository);
});
