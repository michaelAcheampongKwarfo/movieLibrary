import 'package:flutter/material.dart';
import 'package:movie_library/services/constants.dart';
import 'package:movie_library/widgets/app_colors.dart';
import 'package:movie_library/widgets/app_text.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;
  const DetailScreen({
    super.key,
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          data: originalTitle,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: amberColor,
                  image: DecorationImage(
                      image: NetworkImage(Constants.imagePath+posterPath),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill),
                ),

              ),
            ),
            const SizedBox(height: 10),
              const Align(
                alignment: Alignment.center,
                child: AppText(
                data: 'Title : ',
                fontsize: 20,
                fontWeight: FontWeight.bold,
                color: amberColor,
            ),
              ),

            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: AppText(
                data: title,
                fontsize: 20,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AppText(
                        data: 'Date :',
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                        color: amberColor,
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        data: releaseDate,
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppText(
                      data: 'Rating : ',
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                      color: amberColor,
                    ),
                    const SizedBox(width: 10),
                    AppText(
                      data: voteAverage.toString(),
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: AppText(data: 'Over View',
                fontsize: 20.0,
                fontWeight: FontWeight.bold,
                color: amberColor,
              ),
            ),
            const SizedBox(height: 10),
            AppText(data: overview,
              fontsize: 20.0,

            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
