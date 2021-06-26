import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/mobx/movie_state.dart';
import 'package:simple_movie_app/routes/app_router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MovieState(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: MaterialApp.router(
          title: 'Simple Movie App',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        ),
      ),
    );
  }
}
