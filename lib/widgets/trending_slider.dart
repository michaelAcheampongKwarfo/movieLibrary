import 'package:flutter/material.dart';
import 'package:movie_library/services/api_services.dart';
import 'package:movie_library/services/constants.dart';
import 'package:movie_library/widgets/app_colors.dart';

class TrendingSlider extends StatefulWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  State<TrendingSlider> createState() => _TrendingSliderState();
}

class _TrendingSliderState extends State<TrendingSlider> {
  final ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    _apiServices.fetchTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _apiServices.trendingMovies.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: amberColor,
              ),
              child: Image.network(
                Constants.imagePath +
                    _apiServices.trendingMovies[index]['poster_path'],
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }
}
