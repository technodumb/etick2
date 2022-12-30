import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class MovieSelectProvider extends ChangeNotifier {
  MovieSelectProvider() {
    // showListOptions.processShowList();
    print("Network overflowing bruh stoppp");
  }

  // Hover
  int _hoveredMovie = -1;
  int get hoveredMovie => _hoveredMovie;

  void setHoveredMovie(int movieId) {
    _hoveredMovie = movieId;
    notifyListeners();
  }

// Selected
  int _selectedMovie = 0;
  int get selectedMovie => _selectedMovie;

  void selectMovie(int movieIndex) {
    _selectedMovie = movieIndex;
    notifyListeners();
  }

  DateTime _selectedDate = DateTime(2022, 12, 1);
  DateTime get selectedDate => _selectedDate;

  void selectDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  int _selectedSlot = 0;
  int get selectedSlot => _selectedSlot;

  void selectSlot(int slotIndex) {
    _selectedSlot = slotIndex;
    notifyListeners();
  }

  Tuple3<int, DateTime, int> getMovieDateSlot() {
    return Tuple3<int, DateTime, int>(
        selectedMovie, selectedDate, _selectedSlot);
  }
}
