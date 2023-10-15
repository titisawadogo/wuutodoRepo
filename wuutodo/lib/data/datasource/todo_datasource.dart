import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wuutodo/utils/db_keys.dart';

import '../models/models.dart';

class TodoDatasource {
  static final TodoDatasource _instance = TodoDatasource._();
  factory TodoDatasource() => _instance;

  TodoDatasource._() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
         CREATE TABLE ${DBKeys.dbTable}(
          ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${DBKeys.titleColumn} TEXT,
          ${DBKeys.noteColumn} TEXT,
          ${DBKeys.dateColumn} TEXT,
          ${DBKeys.timeColumn} TEXT,
          ${DBKeys.categoryColumn} TEXT,
          ${DBKeys.isCompletedColumn} INTEGER
         )
    ''');
  }

  Future<int> addTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(DBKeys.dbTable, todo.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(DBKeys.dbTable, todo.toJson(),
          where: 'id = ?', whereArgs: [todo.id]);
    });
  }

  Future<int> deleteTodo(Todo todo) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn
          .delete(DBKeys.dbTable, where: 'id = ?', whereArgs: [todo.id]);
    });
  }

  Future<List<Todo>> getAllTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db.query(DBKeys.dbTable, orderBy: 'id DESC');

    return List.generate(data.length, (index) => Todo.fromJson(data[index]));
  }
}
