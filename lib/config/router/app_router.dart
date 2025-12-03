import 'package:go_router/go_router.dart';
import 'package:parcial_3/models/movie_model.dart';
import 'package:parcial_3/presentation/screens/details.dart';
import 'package:parcial_3/presentation/screens/home.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/details',
          name: 'details',
          builder: (context, state) {
            return MovieDetails(movie: state.extra as Movie,);
          }
        ),
      ]
    ),
  ]
);
