class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.tags,
    required this.summary,
  });
  final String id;
  final String title;
  final String director;
  final List<String> tags;
  final String summary;
}
