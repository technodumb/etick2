import 'package:etick2/database/show_list_functions.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MovieShowCalendar extends StatelessWidget {
  final int index;
  const MovieShowCalendar({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final ShowListFunctions showListFunctions = ShowListFunctions();
    final MovieSelectProvider movieSelectProvider =
        Provider.of<MovieSelectProvider>(context);
    final showList = Provider.of<FirebaseProvider>(context).showList;
    final List<DateTime> movieDates = showListFunctions.getShowDatesByMovie(
        showList, movieSelectProvider.selectedMovie);
    final double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: width * 0.32,
      width: width * 0.4,
      // 300/263
      child: TableCalendar(
        pageJumpingEnabled: false,
        headerStyle: const HeaderStyle(
            leftChevronVisible: false,
            rightChevronVisible: false,
            formatButtonVisible: false),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          isTodayHighlighted: false,
          // defaultTextStyle: TextStyle(color: Colors.white),
          defaultDecoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(1000),
          ),
          selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: Colors.green,
          ),
          // disabledDecoration:
        ),
        focusedDay: DateTime(2022, 12, 1),
        firstDay: DateTime(2022, 12, 1),
        lastDay: DateTime(2022, 12, 31),
        onDaySelected: (selectedDay, focusedDay) => {
          movieSelectProvider.selectDate(selectedDay),
          focusedDay = movieSelectProvider.selectedDate,
        },
        shouldFillViewport: true,
        enabledDayPredicate: (day) =>
            showListFunctions.containsDate(movieDates, day),
        selectedDayPredicate: (day) =>
            isSameDay(day, movieSelectProvider.selectedDate),
      ),
    );
  }
}
