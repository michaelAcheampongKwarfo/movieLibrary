import 'package:flutter/material.dart';
import 'package:movie_library/services/api_services.dart';
import 'package:movie_library/widgets/app_colors.dart';
import 'package:movie_library/widgets/app_text.dart';
import 'package:movie_library/widgets/top_rated_slider.dart';
import 'package:movie_library/widgets/trending_slider.dart';
import 'package:movie_library/widgets/tv_shows_slider.dart';
import 'package:movie_library/widgets/up_comming_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    _apiServices.fetchTrendingMovies();
    _apiServices.fetchTopRatedMovies();
    _apiServices.fetchUpcommingMovies();
    _apiServices.fetchTvShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          data: 'Movie Library',
          fontsize: 25.0,
          fontWeight: FontWeight.bold,
          color: amberColor,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              data: 'Trending Movies',
              fontsize: 20.0,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _apiServices.fetchTrendingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: AppText(
                            data: snapshot.error.toString(), fontsize: 15.0),
                      );
                    } else {
                      return const TrendingSlider();
                    }
                  }),
            ),
            const AppText(
              data: 'Top Rated Movies',
              fontsize: 20.0,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _apiServices.fetchTopRatedMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: AppText(
                            data: snapshot.error.toString(), fontsize: 15.0),
                      );
                    } else {
                      return const TopRatedSlider();
                    }
                  }),
            ),
            const AppText(
              data: 'UpComming Movies',
              fontsize: 20.0,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _apiServices.fetchUpcommingMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: AppText(
                            data: snapshot.error.toString(), fontsize: 15.0),
                      );
                    } else {
                      return const UpCommingSlider();
                    }
                  }),
            ),
            const AppText(
              data: 'TV Shows',
              fontsize: 20.0,
            ),
            SizedBox(
              child: FutureBuilder(
                  future: _apiServices.fetchTvShows(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: AppText(
                            data: snapshot.error.toString(), fontsize: 15.0),
                      );
                    } else {
                      return const TvShowsSlider();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
