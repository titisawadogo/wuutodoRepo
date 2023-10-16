import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wuutodo/config/routes/routes.dart';
import 'package:wuutodo/data/data.dart';
import 'package:wuutodo/providers/providers.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateTodoScreen extends ConsumerStatefulWidget {
  static CreateTodoScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTodoScreen();
  const CreateTodoScreen({super.key});

  @override
  ConsumerState<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends ConsumerState<CreateTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Todo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CommonTextField(
                    controller: _titleController,
                    labelText: 'Title',
                  ),
                  const Gap(20),
                  SelectCategory(),
                  const Gap(20),
                  const SelectDateTime(),
                  const Gap(20),
                  CommonTextField(
                    controller: _noteController,
                    MaxLines: 6,
                    labelText: 'Note',
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: _createTodo,
                      child: const DisplayWHiteText(
                        text: 'Create',
                      ))
                ]),
          ),
        ),
      ),
    );
  }

  void _createTodo() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final time = ref.watch(timeProvider);
    final date = ref.watch(dateProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final todo = Todo(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(todoProvider.notifier).createTodo(todo).then((value) {
        AppAlerts.displaySnackbar(context, 'Todo create successfully');
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }
}
