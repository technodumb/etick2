import 'package:etick2/database/user_database.dart';

class ShowInfoDB {
  final int id;
  final int index;
  final int timeSlot;
  final DateTime date;
  List<int> seats;
  ShowInfoDB({
    required this.id,
    required this.index,
    required this.timeSlot,
    required this.date,
    required this.seats,
  });
}

Map rawdata = {
  DateTime(2022, 12, 20): {
    0: {0: [], 1: [], 6: []},
    1: {0: []},
    2: {6: []},
  },
  DateTime(2022, 12, 21): {
    0: {1: []},
    1: {0: [], 1: []},
    2: {0: [], 6: []},
  },
  DateTime(2022, 12, 22): {
    0: {1: [], 6: []},
    2: {1: []},
  },
  DateTime(2022, 12, 23): {
    0: {0: [], 1: [], 6: []},
    2: {0: [], 1: [], 6: []},
  },
};

class ShowListFunctions {
// convert rawdata to showList
  List<ShowInfoDB> rawdataToDB(Map rawdata) {
    List<ShowInfoDB> showList = [];
    int id = 0;
    for (DateTime date in rawdata.keys) {
      for (int timeSlot in rawdata[date].keys) {
        for (int index in rawdata[date][timeSlot].keys) {
          showList.add(
            ShowInfoDB(
              id: id,
              index: index,
              timeSlot: timeSlot,
              date: date,
              seats: rawdata[date][timeSlot][index],
            ),
          );
          id++;
        }
      }
    }
    return showList;
  }

  // convert showList to a list of jsons
  List<Map<String, dynamic>> showListtoJson(List<ShowInfoDB> showList) {
    return showList.map((show) {
      return {
        'id': show.id,
        'index': show.index,
        'timeSlot': show.timeSlot,
        'date': show.date,
        'seats': show.seats,
      };
    }).toList();
  }

  // Convert jsons to showList
  List<ShowInfoDB> showListFromJson(List<Map<String, dynamic>> json) {
    return json.map((show) {
      // List showSeats = show['seats'].map((seat) => seat as bool).toList();
      List<int> showSeats = [];
      for (int i in show['seats']) {
        showSeats.add(i);
      }

      return ShowInfoDB(
        id: show['id'],
        index: show['index'],
        timeSlot: show['timeSlot'],
        date: DateTime.parse(show['date'].toDate().toString()),
        seats: showSeats,
      );
    }).toList();
  }

  List<DateTime> getShowDatesByMovie(List<ShowInfoDB> showList, int index) {
    List<DateTime> dateList = [];
    for (ShowInfoDB show in showList) {
      if (show.index == index && !containsDate(dateList, show.date)) {
        dateList.add(show.date);
      }
    }
    return dateList;
  }

  List<int> getLocsFromSeats(List<bool> seats) {
    List<int> locs = [];
    for (int i = 0; i < seats.length; i++) {
      if (seats[i]) locs.add(i);
    }
    return locs;
  }

  int getIDByMovieDateTime(
      List<ShowInfoDB> showList, int index, DateTime date, int timeSlot) {
    for (ShowInfoDB show in showList) {
      if (show.index == index &&
          show.date.isSameDate(date) &&
          show.timeSlot == timeSlot) {
        return show.id;
      }
    }
    return 0;
  }

  List<int> getTimeSlotsByMovieAndDate(
      List<ShowInfoDB> showList, int index, DateTime date) {
    List<int> timeSlotList = [];
    for (ShowInfoDB show in showList) {
      if (show.index == index && show.date.isSameDate(date)) {
        timeSlotList.add(show.timeSlot);
      }
    }
    return timeSlotList;
  }

  List<int> getSeatLocsByID(List<ShowInfoDB> showList, int id) {
    return showList[id].seats;
  }

  List<bool> getSeatsByID(List<ShowInfoDB> showList, int id) {
    List<bool> seatLocList = List.generate(100, (index) => false);
    for (int i = 0; i < showList[id].seats.length; i++) {
      seatLocList[showList[id].seats[i]] = true;
    }
    return seatLocList;
  }

  int getSeatCountByID(List<ShowInfoDB> showList, int id) {
    // int count = 0;
    return getSeatLocsByID(showList, id).length;
    // return count;
  }

  List<int> updateSeatList(
      List<ShowInfoDB> showList, int id, List<int> seatLocList) {
    // for (int seatLoc in seatLocList) {
    //   showList[id].seats.add(seatLoc);
    // }
    print("before update: ${showList[id].seats}");
    showList[id].seats.addAll(seatLocList);
    print("after update: ${showList[id].seats}");
    return showList[id].seats;
    // return getSeatsByID(showList, id);
  }

  bool containsDate(List<DateTime> dateList, DateTime date) {
    for (DateTime datetime in dateList) {
      if (datetime.isSameDate(date)) return true;
    }
    return false;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
