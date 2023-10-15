import 'package:flutter/material.dart';
import 'package:wuutodo/utils/utils.dart';

@immutable
class DBKeys {
  const DBKeys._();
  static const String dbName = 'todos.db';
  static const String dbTable = 'todos';
  static const String idColumn = TodoKeys.id;
  static const String titleColumn = TodoKeys.title;
  static const String noteColumn = TodoKeys.note;
  static const String timeColumn = TodoKeys.time;
  static const String dateColumn = TodoKeys.date;
  static const String categoryColumn = TodoKeys.category;
  static const String isCompletedColumn = TodoKeys.isCompleted;
}
