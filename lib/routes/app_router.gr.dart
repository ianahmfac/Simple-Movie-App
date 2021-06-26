// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/movie.dart' as _i5;
import '../pages/edit_movie.dart' as _i4;
import '../pages/home_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    EditMovieRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditMovieRouteArgs>(
              orElse: () => const EditMovieRouteArgs());
          return _i4.EditMovie(key: args.key, movie: args.movie);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomePageRoute.name, path: '/'),
        _i1.RouteConfig(EditMovieRoute.name, path: '/edit-movie')
      ];
}

class HomePageRoute extends _i1.PageRouteInfo {
  const HomePageRoute() : super(name, path: '/');

  static const String name = 'HomePageRoute';
}

class EditMovieRoute extends _i1.PageRouteInfo<EditMovieRouteArgs> {
  EditMovieRoute({_i2.Key? key, _i5.Movie? movie})
      : super(name,
            path: '/edit-movie',
            args: EditMovieRouteArgs(key: key, movie: movie));

  static const String name = 'EditMovieRoute';
}

class EditMovieRouteArgs {
  const EditMovieRouteArgs({this.key, this.movie});

  final _i2.Key? key;

  final _i5.Movie? movie;
}
