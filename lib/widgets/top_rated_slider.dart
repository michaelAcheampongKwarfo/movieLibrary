import 'package:flutter/material.dart';
import 'package:movie_library/services/api_services.dart';
import 'package:movie_library/services/constants.dart';
import 'package:movie_library/widgets/app_colors.dart';

class TopRatedSlider extends StatefulWidget {
  const TopRatedSlider({
    super.key,
  });

  @override
  State<TopRatedSlider> createState() => _TopRatedSliderState();
}

class _TopRatedSliderState extends State<TopRatedSlider> {
  final ApiServices _apiServices = ApiServices();
  @override
  void initState() {
    _apiServices.fetchTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _apiServices.topRatedMovies.length,
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
              child: Image.network(
                Constants.imagePath +
                    _apiServices.topRatedMovies[index]['poster_path'],
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
