import 'package:flutter/material.dart';
import 'package:movie_library/widgets/app_colors.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: amberColor,
              ),
            ),
          );
        },
      ),
    );
  }
}