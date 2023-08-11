import 'package:flutter/material.dart';
import 'package:movie_library/services/api_service.dart';
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
  @override
  void initState() {
    ApiServices().loadMovies();
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              data: 'Trending Movies',
              fontsize: 20.0,
            ),
            TrendingSlider(),
            AppText(
              data: 'Top Rated Movies',
              fontsize: 20.0,
            ),
            TopRatedSlider(),
            AppText(
              data: 'UpComming Movies',
              fontsize: 20.0,
            ),
            UpCommingSlider(),
            AppText(
              data: 'TV Shows',
              fontsize: 20.0,
            ),
            TvShowsSlider(),
          ],
        ),
      ),
    );
  }
}
