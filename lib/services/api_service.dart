import 'package:movie_library/services/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ApiServices {
  List trendingMovies = [];
  List topRatedMovies = [];
  List upCommingMovies = [];
  List tvShows = [];

  loadMovies() async {
    TMDB tmdbWithCustomLogs =
        TMDB(ApiKeys(Constants.apiKey, Constants.accesToken),
            logConfig: const ConfigLogger(
              showLogs: true,
              showErrorLogs: true,
            ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upCommingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    trendingMovies = trendingResult['results'];
    topRatedMovies = topRatedResult['results'];
    upCommingMovies = upCommingResult['results'];
    tvShows = tvShowsResult['results'];
  }
}
