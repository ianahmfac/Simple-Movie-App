import 'package:auto_route/auto_route.dart';
import 'package:simple_movie_app/pages/edit_movie.dart';
import 'package:simple_movie_app/pages/home_page.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: EditMovie),
  ],
)
class $AppRouter {}
