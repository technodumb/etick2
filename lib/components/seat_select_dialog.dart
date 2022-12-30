// create a new dialog widget

import 'package:etick2/database/show_list_functions.dart';
import 'package:etick2/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class SeatSelectDialog extends StatelessWidget {
  final bool isUpdate;
  final int bookID;
  const SeatSelectDialog({
    super.key,
    this.isUpdate = false,
    this.bookID = -1,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    final showList = firebaseProvider.showList;
    final username = context.watch<LoginProvider>().getLoggedInUsername();
    Tuple3<int, DateTime, int> movieIndexDateSlot =
        context.watch<MovieSelectProvider>().getMovieDateSlot();
    print(username);
    final showListFunctions = ShowListFunctions();
    final seatSelectProvider = Provider.of<SeatSelectProvider>(context);
    final List<int> preselectedSeatLocs =
        seatSelectProvider.preselectedSeatLocs;
    final List<int> selectedSeatLocs = seatSelectProvider.selectedSeatLocs;
    final double cost = seatSelectProvider.cost;
    return Dialog(
      child: Container(
        height: height * 0.9,
        width: height * 0.7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                'Select your seats:',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 20,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: Text(
                  'Screen this way',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 5.0),
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                        ],
                      ),
                      for (int i = 0; i < 10; i++)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14.0, vertical: 5.0),
                              child: Text(
                                String.fromCharCode(i + 65),
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            for (int j = 0; j < 5; j++)
                              SeatButton(
                                seatIndex: i * 10 + j,
                              ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          for (int i = 5; i < 10; i++)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13.0, vertical: 5.0),
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                        ],
                      ),
                      for (int i = 0; i < 10; i++)
                        Row(
                          children: [
                            for (int j = 5; j < 10; j++)
                              SeatButton(
                                seatIndex: i * 10 + j,
                              ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Seats: ${selectedSeatLocs.isEmpty ? "None" : selectedSeatLocs.length > 10 ? '${selectedSeatLocs.sublist(0, 10).map((index) => getSeatID(index)).join(', ')}...' : selectedSeatLocs.map((index) => getSeatID(index)).join(', ')}',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      'No of Seats: ${selectedSeatLocs.length}',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    Text(
                      'Total Price: ${selectedSeatLocs.length * 100} ${selectedSeatLocs.isEmpty ? '' : '+ 150 (GST) = ₹ $cost/-'}',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          if (selectedSeatLocs.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content:
                                    Text('Please select at least one seat'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            int showID = showListFunctions.getIDByMovieDateTime(
                              showList,
                              movieIndexDateSlot.item1,
                              movieIndexDateSlot.item2,
                              movieIndexDateSlot.item3,
                            );
                            // List<int> updatedList =
                            //     showListFunctions.updateSeatList(
                            //   showList,
                            //   showID,
                            //   selectedSeatLocs,
                            // );
                            isUpdate
                                ? await firebaseProvider
                                    .updateBooking(bookID, selectedSeatLocs,
                                        preselectedSeatLocs, cost)
                                    .then(((value) async =>
                                        await firebaseProvider.refresh()))
                                    .then((value) => Navigator.pop(context))
                                : await firebaseProvider
                                    .addBooking(showID, selectedSeatLocs,
                                        username, cost)
                                    .then((value) async =>
                                        await firebaseProvider.refresh())
                                    .then((value) => Navigator.pop(context));

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Booking Successful',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: Text(
                          isUpdate ? 'Update Seats' : 'Book Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SeatButton extends StatelessWidget {
  final int seatIndex;
  const SeatButton({super.key, required this.seatIndex});

  @override
  Widget build(BuildContext context) {
    final seatSelectProvider = Provider.of<SeatSelectProvider>(context);
    final List<bool> selectedSeats = seatSelectProvider.selectedSeats;
    final List<bool> preselectedSeats = seatSelectProvider.preselectedSeats;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        onPressed: preselectedSeats[seatIndex]
            ? null
            : () {
                seatSelectProvider.toggleSeat(seatIndex);
                print("$seatIndex : ${getSeatID(seatIndex)}");
              },
        style: TextButton.styleFrom(
          backgroundColor: selectedSeats[seatIndex]
              ? Colors.green
              : preselectedSeats[seatIndex]
                  ? Colors.blue
                  : Colors.white,
          minimumSize: Size.square(35),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17.5),
          ),
          side: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        child: SizedBox(),
      ),
    );
  }
}

String getSeatID(int index) {
  return '${String.fromCharCode(index ~/ 10 + 65)}${index % 10 + 1}';
}
