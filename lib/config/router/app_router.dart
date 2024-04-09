import 'package:cat_breeds_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: SplashScreenNative.name,
    builder: (context, state) => const SplashScreenNative(),
  ),
  GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: 'breed/:id',
            name: BreedScreen.name,
            builder: (context, state) {
              final breedId = state.pathParameters['id'] ?? 'no-id';
              return BreedScreen(breedId: breedId);
            }),
      ]),
]);
