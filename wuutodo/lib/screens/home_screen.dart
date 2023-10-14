import 'package:flutter/material.dart';
import 'package:wuutodo/config/routes/routes.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                      text: 'Oct 10, 2023',
                      fontsize: 20,
                      fontweight: FontWeight.normal,
                    ),
                    DisplayWHiteText(
                      text: 'WuuTodo',
                      fontsize: 40,
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
                    const DisplayListOfTodos(todos: [
                      Todo(
                          title: 'title 1',
                          note: 'note',
                          time: '10:25',
                          date: 'Oct, 11 2023',
                          isCompleted: false,
                          category: TodoCategory.personal),
                      Todo(
                          title: 'title 2',
                          note: 'note',
                          time: '10:25',
                          date: 'Oct, 11 2023',
                          isCompleted: false,
                          category: TodoCategory.health)
                    ]),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    DisplayListOfTodos(
                      todos: [
                        Todo(
                            title: 'title 1',
                            note: 'note',
                            time: '10:25',
                            date: 'Oct, 11 2023',
                            isCompleted: true,
                            category: TodoCategory.education),
                        Todo(
                            title: 'title 2',
                            note: 'note',
                            time: '10:25',
                            date: 'Oct, 11 2023',
                            isCompleted: true,
                            category: TodoCategory.work)
                      ],
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
}
