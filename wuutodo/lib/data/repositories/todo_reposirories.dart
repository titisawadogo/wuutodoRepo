import '../models/models.dart';

abstract class TodoRepository {
  Future<void> createTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  Future<List<Todo>> getAllTodos();
}
