import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/mobx/movie_state.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/routes/app_router.gr.dart';
import 'package:simple_movie_app/widgets/custom_text_button.dart';
import 'package:simple_movie_app/widgets/empty_state.dart';
import 'package:simple_movie_app/widgets/list_movie_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToDetailMovie(BuildContext context, {Movie? movie}) {
    context.router.push(EditMovieRoute(movie: movie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
        actions: [
          CustomTextButton(
            onPressed: () => _goToDetailMovie(context),
            title: 'NEW',
          ),
        ],
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final movieState = Provider.of<MovieState>(context, listen: false);
    return Observer(builder: (_) {
      switch (movieState.state) {
        case ListStateMovie.initialize:
          return EmptyState(
            title: 'Empty Movie',
            subtitle: 'Add new movie to the list,\nby pressing \'NEW\' button',
          );
        case ListStateMovie.loaded:
          return ListView.builder(
            itemBuilder: (context, index) {
              final movie = movieState.movies[index];
              return ListMovieCard(
                movie: movie,
                onTap: () => _goToDetailMovie(context, movie: movie),
              );
            },
            itemCount: movieState.movies.length,
          );
      }
    });
  }
}
