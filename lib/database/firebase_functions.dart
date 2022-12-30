import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etick2/database/show_list_functions.dart';
import 'package:etick2/database/moviedata.dart';

import 'user_database.dart';

class FirebaseFunctions {
  // get data from firebase
  final db = FirebaseFirestore.instance;

  // Seats
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('seatDetails');

  final showListOptions = ShowListFunctions();

  List<Map<String, dynamic>> docdata = [];
  List<ShowInfoDB> showList = [];

  Future<List> getShowDataFromFirebase() async {
    docdata = [];
    showList = [];
    await db.collection('seatDetails').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            docdata.add(doc.data() as Map<String, dynamic>);
          },
        );
      },
    ).then((value) => showList = showListOptions.showListFromJson(docdata));
    return showListOptions.showListFromJson(docdata);
  }

  Future<void> putShowDataToFirebase(Map<String, dynamic> show) {
    return db.collection('seatDetails').doc(show['id'].toString()).set(show);
  }

  Future<void> bookSeat(int showID, List<int> showSeats) async {
    print(" about to update $showID, $showSeats, ");
    await db
        .collection('seatDetails')
        .doc(showID.toString())
        .update({'seats': showSeats});
    // db.collection('bookingDetails').add(booking.toJson(booking));
    // return booking;
  }

  Future<void> clearAllSeats() async {
    for (int i = 0; i < showList.length; i++) {
      showList[i].seats.clear();

      putShowDataToFirebase(showListOptions.showListtoJson(showList)[i]);
      // print(showList[i].seats);
      // await db
      //     .collection('seatDetails')
      //     .doc(showList[i].id.toString())
      //     .update({'seats': showList[i].seats});
    }
  }

  // Movie Bookings
  MovieConversion movieConversion = MovieConversion();
  List<Movie> movieList = [];

  Future<void> putMovieDataToFirebase(Movie movie) {
    return db
        .collection('movieDetails')
        .doc(movie.id.toString())
        .set(movieConversion.movieToJson(movie));
  }

  Future<List> getMovieDataFromFirebase() async {
    movieList = [];
    await db.collection('movieDetails').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            movieList.add(movieConversion
                .movieFromJson(doc.data() as Map<String, dynamic>));
          },
        );
      },
    );
    return movieList;
  }

  // user Details
  List<User> userList = [];
  Future<void> putUserDataToFirebase(User user) {
    return db
        .collection('userDetails')
        .doc(user.username)
        .set(user.toJson(user));
  }

  Future<List> getUserDataFromFirebase() async {
    userList = [];
    await db.collection('userDetails').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            userList.add(User.fromJson(doc.data() as Map<String, dynamic>));
          },
        );
      },
    );
    return userList;
  }

  Future<void> addBookingToUser(User user) async {
    await db.collection('userDetails').doc(user.username).update({
      'bookingIDs': user.bookingIDs,
    });
  }

  // Booking Details
  List<Booking> bookingList = [];
  Future<void> putBookingDataToFirebase(Booking booking) async {
    print("are you even working?");
    await db
        .collection('bookingDetails')
        .doc(booking.bookId.toString())
        .set(booking.toJson(booking));
  }

  Future<List> getBookingDataFromFirebase() async {
    bookingList = [];
    await db.collection('bookingDetails').get().then(
      (QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach(
          (doc) {
            bookingList
                .add(Booking.fromJson(doc.data() as Map<String, dynamic>));
          },
        );
      },
    );
    return bookingList;
  }
}
