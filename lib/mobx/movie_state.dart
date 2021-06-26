import 'package:mobx/mobx.dart';
import 'package:simple_movie_app/models/movie.dart';
part 'movie_state.g.dart';

class MovieState = _MovieState with _$MovieState;

enum ListStateMovie { initialize, loaded }

abstract class _MovieState with Store {
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @computed
  ListStateMovie get state {
    if (movies.isEmpty) return ListStateMovie.initialize;
    return ListStateMovie.loaded;
  }

  @action
  void addMovie(Movie movie) {
    movies.add(movie);
  }

  @action
  void deleteMovie(String idMovie) {
    final currentIndex = movies.indexWhere((element) => element.id == idMovie);
    movies.removeAt(currentIndex);
  }

  @action
  void updateMovie(Movie movie) {
    final currentIndex = movies.indexWhere((element) => element.id == movie.id);
    movies[currentIndex] = movie;
  }
}
