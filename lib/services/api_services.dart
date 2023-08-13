import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_library/services/constants.dart';

class ApiServices {
  List trendingMovies = [];
  List topRatedMovies = [];
  List upcommingMovies = [];
  List tvShows = [];

  fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(Constants.trendingUrl));
    if (response.statusCode == 200) {
      Map trendingResult = json.decode(response.body);
      trendingMovies = trendingResult['results'];
    } else {
      print('Failed to load trending movies');
    }
  }

  fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse(Constants.topRatedUrl));
    if (response.statusCode == 200) {
      Map topRatedResult = json.decode(response.body);
      topRatedMovies = topRatedResult['results'];
    } else {
      print('Failed to load trending movies');
    }
  }

  fetchUpcommingMovies() async {
    final response = await http.get(Uri.parse(Constants.upCommingUrl));
    if (response.statusCode == 200) {
      Map upCommingResult = json.decode(response.body);
      upcommingMovies = upCommingResult['results'];
    } else {
      print('Failed to load trending movies');
    }
  }

  fetchTvShows() async {
    final response = await http.get(Uri.parse(Constants.tvShowsUrl));
    if (response.statusCode == 200) {
      Map tvShowsResult = json.decode(response.body);
      tvShows = tvShowsResult['results'];
    } else {
      print('Failed to load trending movies');
    }
  }
}
