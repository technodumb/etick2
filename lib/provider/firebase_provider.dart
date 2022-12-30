import 'package:etick2/database/firebase_functions.dart';
import 'package:etick2/database/moviedata.dart';
import 'package:etick2/database/show_list_functions.dart';
import 'package:etick2/database/user_database.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  FirebaseProvider() {
    init().then((value) => null);
  }
  Future<void> init() async {
    await firebaseFunctions
        // retrieve and sort showList
        .getShowDataFromFirebase()
        .then((value) => showList = firebaseFunctions.showList)
        .then((value) => showList.sort((a, b) => a.id > b.id ? 1 : -1))
        .then((value) => print("showlist length: ${showList.length}"))
        // retrieve and sort movieList
        .then((value) => firebaseFunctions.getMovieDataFromFirebase())
        .then((value) => movieList = firebaseFunctions.movieList)
        .then((value) => movieList.sort((a, b) => a.id > b.id ? 1 : -1))
        .then((value) => print("movielist length: ${movieList.length}"))
        // retrieve userList
        .then((value) => firebaseFunctions.getUserDataFromFirebase())
        .then((value) => userList = firebaseFunctions.userList)
        .then((value) => print(userList[0].toJson(userList[0])))
        // retrieve and sort bookingList
        .then((value) => firebaseFunctions.getBookingDataFromFirebase())
        .then((value) => bookingList = firebaseFunctions.bookingList)
        .then(
            (value) => bookingList.sort((a, b) => a.bookId > b.bookId ? 1 : -1))
        .then((value) => print("bookinglist length: ${bookingList.length}"))
        .then((value) => notifyListeners());
  }

  Future<void> refresh() async {
    await firebaseFunctions
        .getShowDataFromFirebase()
        .then((value) => showList = firebaseFunctions.showList)
        .then((value) => showList.sort((a, b) => a.id > b.id ? 1 : -1))
        .then((value) => print("showLIst length : ${showList.length}"))
        .then((value) => print("bookinglist length: ${bookingList.length}"))
        .then((value) => firebaseFunctions.getBookingDataFromFirebase())
        .then((value) => bookingList = firebaseFunctions.bookingList)
        .then(
            (value) => bookingList.sort((a, b) => a.bookId > b.bookId ? 1 : -1))
        .then((value) => print("bookinglist length: ${bookingList.length}"))
        .then((_) => notifyListeners());
  }

  List<ShowInfoDB> showList = [];
  List<Movie> movieList = [];
  List<User> userList = [];
  List<Booking> bookingList = [];

  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();
  FirebaseFunctions get firebaseFunctions => _firebaseFunctions;

  final ShowListFunctions _showListFunctions = ShowListFunctions();
  ShowListFunctions get showListFunctions => _showListFunctions;

  Future<void> addBooking(
      int id, List<int> bookSeats, String username, double cost) async {
    Booking booking = Booking(
        bookId: bookingList.length,
        showID: id,
        seats: bookSeats,
        username: username,
        cost: cost);
    // firebaseFunctions.putBookingDataToFirebase(booking);
    for (User user in userList) {
      // print(user.username);
      print(booking.username);
      if (user.username == booking.username) {
        user.bookingIDs.add(booking.bookId);
        print(user.bookingIDs);
        // firebaseFunctions.putUserDataToFirebase(user);
        await firebaseFunctions.addBookingToUser(user);
        break;
      }
    }
    await firebaseFunctions.putBookingDataToFirebase(booking);

    await firebaseFunctions.bookSeat(
        id, showListFunctions.updateSeatList(showList, id, bookSeats));
    bookingList.add(booking);
    // await refresh();
    notifyListeners();
  }

  Future<void> updateBooking(int bookID, List<int> bookSeats,
      List<int> preselectedSeatLocs, double cost) async {
    // firebaseFunctions.putBookingDataToFirebase(booking);
    Booking booking = bookingList[bookID];
    booking.seats = bookSeats;
    booking.cost = cost;

    List<int> bookSeatsList = List.from(bookSeats);
    bookSeatsList.addAll(preselectedSeatLocs);

    await firebaseFunctions.bookSeat(booking.showID, bookSeatsList);
    await firebaseFunctions.putBookingDataToFirebase(booking);

    // refresh();
    notifyListeners();
  }

  Future<void> cancelBooking(
      int bookingID, List<int> preselectedSeatLocs) async {
    int showID = bookingList[bookingID].showID;
    bookingList[bookingID] = Booking.emptyBoking(bookingID);
    // bookingList[bookingID].seats.clear();
    // print("bookingList seats: ${Booking.emptyBoking().seats.toString()}");

    try {
      await firebaseFunctions
          .bookSeat(showID, preselectedSeatLocs)
          .then(((value) async => await firebaseFunctions
              .putBookingDataToFirebase(bookingList[bookingID])))
          .then((value) => print("success"));
    } catch (e) {
      print(e);
    }

    userList.forEach((element) {
      if (element.bookingIDs.contains(bookingID)) {
        element.bookingIDs.remove(bookingID);
        firebaseFunctions.putUserDataToFirebase(element);
      } else {
        print('no booking removed');
      }
    });

    notifyListeners();
  }

  void addUser(User user) {
    firebaseFunctions.putUserDataToFirebase(user);
    userList.add(user);
    notifyListeners();
  }
}
