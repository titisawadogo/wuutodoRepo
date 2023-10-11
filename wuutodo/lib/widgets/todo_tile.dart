import 'package:flutter/material.dart';
import 'package:wuutodo/data/data.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/utils/utils.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, required this.todo, this.onCompleted});

  final Todo todo;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final style = context.textTheme;
    final double iconOpacity = todo.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = todo.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        todo.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = todo.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Padding(
      padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todo.category.color.withOpacity(backgroundOpacity),
                border: Border.all(
                    width: 2,
                    color: todo.category.color.withOpacity(iconOpacity))),
            child: Center(
                child: Icon(
              todo.category.icon,
              color: todo.category.color.withOpacity(iconOpacity),
            )),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 20,
                      fontWeight: fontWeight),
                ),
                Text(
                  todo.time,
                  style:
                      style.titleMedium?.copyWith(decoration: textDecoration),
                )
              ],
            ),
          ),
          Checkbox(value: todo.isCompleted, onChanged: onCompleted)
        ],
      ),
    );
  }
}
