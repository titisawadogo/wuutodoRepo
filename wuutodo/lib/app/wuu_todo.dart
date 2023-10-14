import 'package:flutter/material.dart';
import 'package:wuutodo/config/config.dart';
import 'package:wuutodo/config/routes/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WuuTodo extends ConsumerWidget {
  const WuuTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
