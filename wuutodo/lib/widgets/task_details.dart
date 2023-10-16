import 'package:flutter/material.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:gap/gap.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        CircleContainer(
          color: todo.category.color.withOpacity(0.3),
          child: Icon(
            todo.category.icon,
            color: todo.category.color.withOpacity(0.25),
          ),
        ),
        const Gap(16),
        Text(
          todo.title,
          style: style.titleMedium!
              .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          todo.time,
          style: style.titleMedium,
        ),
        const Gap(16),
        Visibility(
            visible: !todo.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This Todo has been completed on ${todo.time}'),
                Icon(
                  Icons.check_box,
                  color: todo.category.color,
                )
              ],
            )),
        const Gap(16),
        Divider(
          thickness: 1.5,
          color: todo.category.color,
        ),
        const Gap(16),
        Text(todo.note.isEmpty ? "There is no note here" : todo.note),
        const Gap(16),
        Visibility(
            visible: todo.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Todo completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ))
      ]),
    );
  }
}
