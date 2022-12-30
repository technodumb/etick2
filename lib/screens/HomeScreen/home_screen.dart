import 'package:flutter/material.dart';
import 'package:etick2/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MovieSliders(
                              sectionName: 'Trending Now',
                              movieList: List.generate(7, (index) => index)),
                          const MovieSliders(
                            sectionName: 'Current Movies',
                            movieList: [11, 10, 16],
                          ),
                          const MovieSliders(
                            sectionName: 'Upcoming Movies',
                            movieList: [22, 24, 23, 25],
                          ),
                          const SizedBox(
                            height: 20,
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
