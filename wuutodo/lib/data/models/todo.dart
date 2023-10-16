import 'dart:convert';

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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TodoKeys.id: id,
      TodoKeys.title: title,
      TodoKeys.note: note,
      TodoKeys.time: time,
      TodoKeys.date: date,
      TodoKeys.category: category.name,
      TodoKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map[TodoKeys.id],
      title: map[TodoKeys.title],
      note: map[TodoKeys.note],
      time: map[TodoKeys.time],
      date: map[TodoKeys.date],
      category: TodoCategory.stringToCategory(map[TodoKeys.category]),
      isCompleted: map[TodoKeys.isCompleted] == 1 ? true : false,
    );
  }

  Todo copyWith({
    int? id,
    String? title,
    String? note,
    String? time,
    String? date,
    TodoCategory? category,
    bool? isCompleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      time: time ?? this.time,
      date: date ?? this.date,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
