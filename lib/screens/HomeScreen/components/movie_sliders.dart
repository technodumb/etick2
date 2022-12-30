import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'movie_box.dart';

class MovieSliders extends StatelessWidget {
  final String sectionName;
  final List movieList;

  const MovieSliders({
    super.key,
    required this.sectionName,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    final movieSelectProvider = Provider.of<MovieSelectProvider>(context);
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          sectionName,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: movieList
                  .map(
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: firebaseProvider.movieList.isNotEmpty
                            ? () {
                                movieSelectProvider.selectMovie(index % 10);
                                movieSelectProvider
                                    .selectDate(DateTime(2022, 12, 1));
                                // go to movie details page
                                Navigator.pushNamed(
                                  context,
                                  '/movie_details',
                                  // arguments: index,
                                );
                              }
                            : () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onHover: (value) {
                          if (value) {
                            movieSelectProvider.setHoveredMovie(index);
                          } else {
                            movieSelectProvider.setHoveredMovie(-1);
                          }
                        },
                        child: MovieBox(
                          index: index,
                          isHovered: movieSelectProvider.hoveredMovie == index,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
