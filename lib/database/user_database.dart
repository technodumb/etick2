class User {
  String username;
  String password;
  List<int> bookingIDs;

  User(
      {required this.username,
      required this.password,
      required this.bookingIDs});

  Map<String, dynamic> toJson(User user) {
    return {
      'username': user.username,
      'password': user.password,
      'bookingIDs': user.bookingIDs
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    List<int> bookingIds = [];
    for (int bookingID in json['bookingIDs']) {
      bookingIds.add(bookingID);
    }
    return User(
      username: json['username'],
      password: json['password'],
      bookingIDs: bookingIds,
    );
  }
}

class Booking {
  int bookId;
  String username;
  int showID;
  List<int> seats;
  double cost;

  Booking({
    required this.bookId,
    required this.username,
    required this.showID,
    required this.seats,
    required this.cost,
  });

  Map<String, dynamic> toJson(Booking booking) {
    return {
      'bookId': booking.bookId,
      'username': booking.username,
      'showID': booking.showID,
      'seats': booking.seats,
      'cost': booking.cost,
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookId: json['bookId'],
      username: json['username'],
      showID: json['showID'],
      seats: json['seats'].cast<int>(),
      cost: json['cost'],
    );
  }

  static Booking emptyBoking(int bookingID) =>
      Booking(bookId: bookingID, username: '', showID: 0, seats: [], cost: 0);
}
