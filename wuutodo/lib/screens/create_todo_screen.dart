import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wuutodo/widgets/widgets.dart';
import 'package:gap/gap.dart';

class CreateTodoScreen extends StatelessWidget {
  static CreateTodoScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTodoScreen();
  const CreateTodoScreen({super.key});

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
                  const CommonTextField(
                    labelText: 'Title',
                  ),
                  const Gap(20),
                  SelectCategory(),
                  const Gap(20),
                  const SelectDateTime(),
                  const Gap(20),
                  const CommonTextField(
                    MaxLines: 6,
                    labelText: 'Note',
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () {},
                      child: const DisplayWHiteText(
                        text: 'Create',
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
