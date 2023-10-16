import 'package:flutter/material.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/providers/providers.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'common_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayListOfTodos extends ConsumerWidget {
  const DisplayListOfTodos(
      {super.key, required this.todos, this.isCompleted = false});

  final List<Todo> todos;
  final bool isCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompleted ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTodosMesssage =
        isCompleted ? 'No completed todo yet!' : 'There is no todo!';
    return CommonContainer(
      height: height,
      child: (todos.isEmpty)
          ? Center(
              child: Text(
                emptyTodosMesssage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: todos.length,
              itemBuilder: (ctx, index) {
                final todo = todos[index];
                return InkWell(
                    onLongPress: () {
                      AppAlerts.showAlertDeleteDialog(
                          context: context, ref: ref, todo: todo);
                    },
                    onTap: () async {
                      await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          context: context,
                          builder: (context) {
                            return TodoDetails(todo: todo);
                          });
                    },
                    child: TodoTile(
                        todo: todo,
                        onCompleted: (value) async {
                          await ref
                              .read(todoProvider.notifier)
                              .updateTodo(todo)
                              .then(
                            (value) {
                              AppAlerts.displaySnackbar(
                                  context,
                                  todo.isCompleted
                                      ? 'Task incompleted'
                                      : 'Task completed');
                            },
                          );
                        }));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
