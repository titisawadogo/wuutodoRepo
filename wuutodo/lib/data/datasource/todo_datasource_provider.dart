import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wuutodo/data/data.dart';

final todoDatasourceProvider = Provider<TodoDatasource>((ref) {
  return TodoDatasource();
});
