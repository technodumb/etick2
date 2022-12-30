import 'package:etick2/database/database.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:etick2/components/components.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final int index = ModalRoute.of(context)!.settings.arguments as int;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final movieSelectProvider = Provider.of<MovieSelectProvider>(context);
    final selectedIndex = movieSelectProvider.selectedMovie;
    final Movie movie =
        context.watch<FirebaseProvider>().movieList[selectedIndex];
    // movieList[selectedIndex];

    return SafeArea(
      child: Scaffold(
        // drawer: const SideBar(),
        body: Row(
          children: [
            const SideBar(),
            Expanded(
              child: Column(
                children: [
                  Header(
                    context: context,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: height * 0.05,
                              horizontal: width * 0.05,
                            ),
                            // height: height * 0.5,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black,
                                  Colors.black.withOpacity(0.5),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      width: width * 0.25,
                                      image: AssetImage(
                                        movie.image,
                                      ),
                                    ),
                                    // const Spacer(),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            movie.name,
                                            style: TextStyle(
                                              fontSize: width * 0.03,
                                              color: Colors.white,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                            height: height * 0.03,
                                            // alignment: Alignment.centerLeft,
                                          ),
                                          Text(
                                            movie.description,
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Row(children: []),
                              ],
                            ),
                          ),
                          Container(
                            // height: height * 0.4,
                            width: double.infinity,
                            // color: Colors.black,
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Book Tickets',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MovieShowCalendar(
                                        index: selectedIndex,
                                      ),
                                    ),
                                    // TextButton()
                                    Column(children: [
                                      for (int i = 0; i < 3; i++)
                                        TimeSlotButton(slotIndex: i)
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
