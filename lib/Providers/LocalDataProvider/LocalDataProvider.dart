import 'package:flutter/cupertino.dart';

class LocalDataProvider extends ChangeNotifier {
  String _authToken;

  String get authToken => _authToken;

  set setAuthToken(String authToken) {
    _authToken = authToken;
    notifyListeners();
  }
}
