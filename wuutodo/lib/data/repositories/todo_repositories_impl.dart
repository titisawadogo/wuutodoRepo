import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/data/models/todo.dart';
import 'package:wuutodo/data/repositories/repositories.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _datasource;

  TodoRepositoryImpl(this._datasource);

  @override
  Future<void> createTodo(Todo todo) async {
    // TODO: implement createTodo
    try {
      await _datasource.addTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    // TODO: implement deleteTodo
    try {
      await _datasource.deleteTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Todo>> getAllTodos() async {
    // TODO: implement getAllTodos
    try {
      return await _datasource.getAllTodos();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // TODO: implement updateTodo
    try {
      await _datasource.updateTodo(todo);
    } catch (e) {
      throw '$e';
    }
  }
}
