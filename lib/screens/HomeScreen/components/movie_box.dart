import 'package:etick2/database/database.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';

class MovieBox extends StatelessWidget {
  final int index;
  final bool isHovered;
  const MovieBox({super.key, required this.index, this.isHovered = false});

  @override
  Widget build(BuildContext context) {
    List<Movie> movieData = context.watch<FirebaseProvider>().movieList;

    Movie movie = movieData.isEmpty
        ? MovieConversion().sampleMovie
        : movieData[index % 10];
    return movieData.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Image(
                image: AssetImage(
                  movie.image,
                ),
                height: 300,
              ),
              if (isHovered)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              movie.name,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              movie.genre.join(" | "),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "IMDb Rating: ${movie.rating}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Duration: ${movie.duration}",
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 40,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color:
                                  movie.current ? Colors.green : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: movie.current
                                ? const Text(
                                    'Book Tickets',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Text('See Details'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
  }
}
