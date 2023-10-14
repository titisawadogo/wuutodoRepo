import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wuutodo/config/routes/routes.dart';

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: navigationKey,
      initialLocation: RouteLocation.home,
      routes: appRoutes);
});
