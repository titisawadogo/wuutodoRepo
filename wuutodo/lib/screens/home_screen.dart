import 'package:flutter/material.dart';
import 'package:wuutodo/config/routes/routes.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/providers/providers.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final todoState = ref.watch(todoProvider);
    final inCompletedTasks = _incompltedTask(todoState.todos, ref);
    final completedTasks = _compltedTask(todoState.todos, ref);

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWHiteText(
                      text: 'Welcome to',
                      fontsize: 20,
                      fontweight: FontWeight.normal,
                    ),
                    DisplayWHiteText(
                      text: 'WuuTodo',
                      fontsize: 50,
                    ),
                  ]),
            ),
          ],
        ),
        Positioned(
            top: 130,
            right: 0,
            left: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListOfTodos(todos: inCompletedTasks),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTodos(
                      todos: completedTasks,
                      isCompleted: true,
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {
                          context.push(RouteLocation.createTodo);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWHiteText(
                            text: 'Add New Todo',
                          ),
                        ))
                  ],
                ),
              ),
            ))
      ],
    ));
  }

  List<Todo> _incompltedTask(List<Todo> todos, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Todo> filteredTodo = [];

    for (var todo in todos) {
      if (!todo.isCompleted) {
        final isTodoDay = Helpers.isTodoFromSelectedDate(todo, date);
        if (isTodoDay) {
          filteredTodo.add(todo);
        }
      }
    }
    return filteredTodo;
  }

  List<Todo> _compltedTask(List<Todo> todos, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Todo> filteredTodo = [];

    for (var todo in todos) {
      if (todo.isCompleted) {
        final isTodoDay = Helpers.isTodoFromSelectedDate(todo, date);
        if (isTodoDay) {
          filteredTodo.add(todo);
        }
      }
    }
    return filteredTodo;
  }
}
