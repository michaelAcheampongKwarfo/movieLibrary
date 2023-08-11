class MovieModel {
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  MovieModel({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      backDropPath: json['backdrop_path'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
    );
  }
}
