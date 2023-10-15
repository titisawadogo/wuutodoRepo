import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/providers/providers.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  final TodoRepository _repository;
  TodoNotifier(this._repository) : super(const TodoState.initial());

  Future<void> createTodo(Todo todo) async {
    try {
      await _repository.createTodo(todo);
      getTodos();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _repository.deleteTodo(todo);
      getTodos();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      final isCompleted = !todo.isCompleted;
      final updatedTask = todo.copyWith(isCompleted: isCompleted);
      await _repository.updateTodo(updatedTask);
      getTodos();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTodos() async {
    try {
      final tasks = await _repository.getAllTodos();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
