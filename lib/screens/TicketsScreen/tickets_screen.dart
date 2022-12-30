import 'package:etick2/database/database.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:etick2/components/components.dart';
import 'package:intl/intl.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String currentUsername =
        context.read<LoginProvider>().getLoggedInUsername();
    // );
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(context);
    List<Booking> allBookings = firebaseProvider.bookingList;
    List<Movie> allMovies = firebaseProvider.movieList;
    List<ShowInfoDB> allShows = firebaseProvider.showList;
    List<User> allUsers = firebaseProvider.userList;
    List<String> timeSlotTimes = ["9:00 AM", "2:00 PM", "8:00 PM"];
    User currentUser =
        allUsers.where((element) => element.username == currentUsername).first;

    String getMovieName(int bookID) {
      return allMovies[allShows[allBookings[bookID].showID].index].name;
    }

    String getShowDate(int bookID) {
      // return allShows[booking.showID].date;
      // convert to string with format dd-MM-yyyy
      return DateFormat('dd-MM-yyyy')
          .format(allShows[allBookings[bookID].showID].date);
    }

    String getShowTime(int bookID) {
      return timeSlotTimes[allShows[allBookings[bookID].showID].timeSlot];
    }

    print("allbookings ${allBookings.length}");
    // print(
    //     allBookings.where((e) => e.username == currentUser.username).toList());
    // print(allMovies);
    // print(allShows);
    print(currentUser.toJson(currentUser));
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
                          SizedBox(height: 20, width: double.infinity),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "My Tickets",
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(height: 20, width: double.infinity),
                          for (int i = 0;
                              i < currentUser.bookingIDs.length;
                              i++)
                            TicketButtons(
                              bookID: currentUser.bookingIDs[i],
                              showDate: getShowDate(currentUser.bookingIDs[i]),
                              showTime: getShowTime(currentUser.bookingIDs[i]),
                              movieName:
                                  getMovieName(currentUser.bookingIDs[i]),
                              booking: allBookings[currentUser.bookingIDs[i]],
                            )
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

class TicketButtons extends StatelessWidget {
  final int bookID;
  final String showDate;
  final String showTime;
  final String movieName;
  final Booking booking;
  const TicketButtons({
    super.key,
    required this.bookID,
    required this.showDate,
    required this.showTime,
    required this.movieName,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    // print(allBookings);

    SeatSelectProvider seatSelectProvider =
        Provider.of<SeatSelectProvider>(context);
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(
      context,
    );

    ShowListFunctions showListFunctions = ShowListFunctions();
    List<Booking> allBookings = firebaseProvider.bookingList;
    List<ShowInfoDB> allShows = firebaseProvider.showList;
    // List<int>
    // print(preselectedSeats);
    // List<int> getPreselectedSeats(int bookID) {
    //   List<int> preselectedSeats = ;
    //   // for (int i = 0; i < 100; i++) {
    //   //   bool isBooked = allShows[allBookings[bookID].showID].seats[i];
    //   //   if (isBooked) {
    //   //     preselectedSeats.add(i);
    //   //   }
    //   // }
    //   print(preselectedSeats);
    //   return preselectedSeats;
    // }

    return TextButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  showDate,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  showTime,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              width: 1,
              height: 100,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Booking ID: $bookID',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      // textAlign: TextAlign.end,
                    ),
                  ),
                  Text(
                    movieName,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seats: ${booking.seats.length > 10 ? '${booking.seats.sublist(0, 10).map((index) => getSeatID(index)).join(', ')}...' : booking.seats.map((index) => getSeatID(index)).join(', ')}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      // Spacer(),
                      Text(
                        "No. of seats: ${booking.seats.length}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 100,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    List<int> selectedLocs = List.from(booking.seats);
                    print("1... ${booking.seats}");
                    List<int> preselectedLocs = List.from(showListFunctions
                        .getSeatLocsByID(allShows, allBookings[bookID].showID));
                    // List<int> preselectedLocs = preselectedSeats;
                    print("2... ${booking.seats}");

                    preselectedLocs.removeWhere(
                        (element) => selectedLocs.contains(element));

                    print("3... ${booking.seats}");

                    seatSelectProvider.setSeats(selectedLocs, preselectedLocs);
                    print("4... ${booking.seats}");
                    showDialog(
                        context: context,
                        builder: (_) => SeatSelectDialog(
                              isUpdate: true,
                              bookID: bookID,
                            ));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    child: Text(
                      "Change Seats",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // List<int> preselectedLocs = List.from(showListFunctions
                    //     .getSeatLocsByID(allShows, allBookings[bookID].showID));
                    List<int> selectedLocs = List.from(booking.seats);
                    print("1... ${booking.seats}");
                    List<int> preselectedLocs = List.from(showListFunctions
                        .getSeatLocsByID(allShows, allBookings[bookID].showID));
                    print("2... ${booking.seats}");

                    preselectedLocs.removeWhere(
                        (element) => selectedLocs.contains(element));
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text("Cancel Booking"),
                              content: Text(
                                  "Are you sure you want to cancel this booking?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    firebaseProvider
                                        .cancelBooking(bookID, preselectedLocs)
                                        .then((value) async =>
                                            await firebaseProvider.refresh());

                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            ));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 40,
                    child: Text(
                      "Cancel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
