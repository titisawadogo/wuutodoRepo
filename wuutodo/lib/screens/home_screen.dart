import 'package:flutter/material.dart';
import 'package:wuutodo/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:wuutodo/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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
            top: 170,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CommonContainer(
                    height: deviceSize.height * 0.3,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 8,
                        itemBuilder: (ctx, index) {
                          return const Text('Home');
                        }),
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  CommonContainer(
                    height: deviceSize.height * 0.25,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 8,
                        itemBuilder: (ctx, index) {
                          return const Text('Home');
                        }),
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWHiteText(
                          text: 'Add New Todo',
                        ),
                      ))
                ],
              ),
            ))
      ],
    ));
  }
}
