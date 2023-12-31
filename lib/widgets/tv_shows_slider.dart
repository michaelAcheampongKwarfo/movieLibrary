import 'package:flutter/material.dart';
import 'package:movie_library/services/api_services.dart';
import 'package:movie_library/services/constants.dart';
import 'package:movie_library/widgets/app_colors.dart';

import '../presentation/details_screen.dart';

class TvShowsSlider extends StatefulWidget {
  const TvShowsSlider({
    super.key,
  });

  @override
  State<TvShowsSlider> createState() => _TvShowsSliderState();
}

class _TvShowsSliderState extends State<TvShowsSlider> {
  final ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    _apiServices.fetchTvShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _apiServices.tvShows.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: amberColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: _apiServices.tvShows[index]['title'],
                          backDropPath: Constants.imagePath +
                              _apiServices.tvShows[index]
                              ['backdrop_path'],
                          originalTitle: _apiServices.tvShows[index]
                          ['original_title'],
                          overview: _apiServices.tvShows[index]
                          ['overview'],
                          posterPath: _apiServices.tvShows[index]
                          ['poster_path'],
                          releaseDate: _apiServices.tvShows[index]
                          ['release_date'],
                          voteAverage: _apiServices.tvShows[index]
                          ['vote_average']),
                    ),
                  );
                },
                child: Image.network(
                  Constants.imagePath +
                      _apiServices.tvShows[index]['poster_path'],
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
