import 'package:etick2/components/components.dart';
import 'package:etick2/database/show_list_functions.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
// import 'components.dart';
// import '../../../components/seat_select_dialog.dart';

class TimeSlotButton extends StatelessWidget {
  final int slotIndex;
  const TimeSlotButton({super.key, required this.slotIndex});

  @override
  Widget build(BuildContext context) {
    final movieSelectProvider = Provider.of<MovieSelectProvider>(context);
    final selectedIndex = movieSelectProvider.selectedMovie;
    final selectedDate = movieSelectProvider.selectedDate;
    final showList = context.watch<FirebaseProvider>().showList;
    final SeatSelectProvider seatSelectProvider =
        Provider.of<SeatSelectProvider>(context);
    final showListFunctions = ShowListFunctions();
    final List getSlotIndices = showListFunctions.getTimeSlotsByMovieAndDate(
        showList, selectedIndex, selectedDate);
    int showID = showListFunctions.getIDByMovieDateTime(
        showList, selectedIndex, selectedDate, slotIndex);

    // print(showTimeSlots);
    List<String> timeSlots = ["9:00 AM", "2:00 PM", "8:00 PM"];
    print('works??? $getSlotIndices');
    return Visibility(
      visible: getSlotIndices.contains(slotIndex),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size(200, 50),
                padding: EdgeInsets.all(20),
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                print('a');
                movieSelectProvider.selectSlot(slotIndex);
                print('b');
                seatSelectProvider.setSeats(
                    [], showListFunctions.getSeatLocsByID(showList, showID));
                showDialog(
                    context: context, builder: (context) => SeatSelectDialog());
                print('c');
              },
              child: Text(
                "Show #$slotIndex : ${timeSlots[slotIndex]}",
                // '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              // '',
              "${100 - showListFunctions.getSeatCountByID(showList, showID)} seats left",
              style: TextStyle(
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
