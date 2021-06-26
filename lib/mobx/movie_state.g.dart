// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieState on _MovieState, Store {
  Computed<ListStateMovie>? _$stateComputed;

  @override
  ListStateMovie get state =>
      (_$stateComputed ??= Computed<ListStateMovie>(() => super.state,
              name: '_MovieState.state'))
          .value;

  final _$moviesAtom = Atom(name: '_MovieState.movies');

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$_MovieStateActionController = ActionController(name: '_MovieState');

  @override
  void addMovie(Movie movie) {
    final _$actionInfo =
        _$_MovieStateActionController.startAction(name: '_MovieState.addMovie');
    try {
      return super.addMovie(movie);
    } finally {
      _$_MovieStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteMovie(String idMovie) {
    final _$actionInfo = _$_MovieStateActionController.startAction(
        name: '_MovieState.deleteMovie');
    try {
      return super.deleteMovie(idMovie);
    } finally {
      _$_MovieStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateMovie(Movie movie) {
    final _$actionInfo = _$_MovieStateActionController.startAction(
        name: '_MovieState.updateMovie');
    try {
      return super.updateMovie(movie);
    } finally {
      _$_MovieStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
state: ${state}
    ''';
  }
}
