class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String posterUrl;
  final num voteAverage;
  final int voteCount;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterUrl,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      posterUrl: json['poster_path'].toString().isNotEmpty ? 'https://image.tmdb.org/t/p/w300/${json['poster_path']}' : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
      voteAverage: json['vote_average'] ?? 0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}