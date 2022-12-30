import 'package:flutter/material.dart';

class SeatSelectProvider extends ChangeNotifier {
  List<bool> _preselectedSeats = [];
  List<bool> _selectedSeats = [];
  List<int> _preselectedSeatLocs = [];
  List<int> _selectedSeatLocs = [];

  get preselectedSeats => _preselectedSeats;
  get selectedSeats => _selectedSeats;
  get preselectedSeatLocs => _preselectedSeatLocs;
  get selectedSeatLocs => _selectedSeatLocs;

  void setSeats(List<int> selected, List<int> preselected) {
    clearSeats();

    for (int i = 0; i < selected.length; i++) {
      _selectedSeats[selected[i]] = true;
    }
    for (int i = 0; i < preselected.length; i++) {
      _preselectedSeats[preselected[i]] = true;
    }
    _preselectedSeatLocs = List.from(preselected);
    _selectedSeatLocs = List.from(selected);
    _cost = _selectedSeatLocs.length * 100 + 150;
    notifyListeners();
  }

  void clearSeats() {
    _preselectedSeats = List.generate(100, (index) => false);
    _selectedSeats = List.generate(100, (index) => false);
    _preselectedSeatLocs.clear();
    _selectedSeatLocs.clear();
    _cost = 0;
    notifyListeners();
  }

  void toggleSeat(int seatIndex) {
    if (_selectedSeats[seatIndex]) {
      _selectedSeatLocs.remove(seatIndex);
    } else {
      _selectedSeatLocs.add(seatIndex);
      _selectedSeatLocs.sort();
    }
    _selectedSeats[seatIndex] = !_selectedSeats[seatIndex];
    _cost = _selectedSeatLocs.length * 100 + 150;
    notifyListeners();
  }

  double _cost = 0;
  get cost => _cost;
}
