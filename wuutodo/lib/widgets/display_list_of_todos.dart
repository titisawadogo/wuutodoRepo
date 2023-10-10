import 'package:flutter/material.dart';
import 'package:wuutodo/utils/utils.dart';

import 'common_container.dart';

class DisplayListOfTodos extends StatelessWidget {
  const DisplayListOfTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return CommonContainer(
      height: deviceSize.height * 0.25,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 8,
          itemBuilder: (ctx, index) {
            return const Text('Home');
          }),
    );
  }
}
