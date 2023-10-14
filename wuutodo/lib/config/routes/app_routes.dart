import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wuutodo/config/routes/routes.dart';
import 'package:wuutodo/screens/screens.dart';

final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationKey,
      builder: HomeScreen.builder),
  GoRoute(
      path: RouteLocation.createTodo,
      parentNavigatorKey: navigationKey,
      builder: CreateTodoScreen.builder)
];
