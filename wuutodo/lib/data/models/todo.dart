import 'package:equatable/equatable.dart';
import 'package:wuutodo/utils/utils.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final TodoCategory category;
  final bool isCompleted;

  const Todo(
      {this.id,
      required this.title,
      required this.note,
      required this.time,
      required this.date,
      required this.category,
      required this.isCompleted});

  @override
  List<Object> get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }
}
