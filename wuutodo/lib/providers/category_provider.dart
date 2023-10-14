import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wuutodo/utils/utils.dart';

final categoryProvider = StateProvider<TodoCategory>((ref) {
  return TodoCategory.others;
});
