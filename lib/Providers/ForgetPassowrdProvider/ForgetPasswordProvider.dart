import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool isUserNameValidate = false;
  bool hasError = false;
  String errorMessage;


  void setIsValidated(value) {
    isUserNameValidate = value;
    notifyListeners();
  }

  bool getIsValidated() {
    return isUserNameValidate;
  }

  void setError(value) {
    hasError = value;
    notifyListeners();
  }

  bool getError() {
    return hasError;
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners();
  }

  String getMessage() {
    return errorMessage;
  }
}
