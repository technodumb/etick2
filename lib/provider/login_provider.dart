import 'package:etick2/database/user_database.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void disableLoading() {
    _isLoading = false;
    notifyListeners();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;

  void toggleLogin() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  String _currentUsername = 'New';

  void login(User user) {
    _currentUsername = user.username;
    notifyListeners();
  }

  void register(User user) {
    _currentUsername = user.username;
    notifyListeners();
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  // void setBookingIDsForUser(List<int> bookingIDs) {
  //   _currentUser.bookingIDs = bookingIDs;
  //   notifyListeners();
  // }

  String getLoggedInUsername() {
    // notifyListeners();
    return _currentUsername;
  }
}
