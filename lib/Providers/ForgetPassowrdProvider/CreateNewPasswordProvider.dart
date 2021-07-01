import 'package:flutter/cupertino.dart';

class CreatePasswordProvider with ChangeNotifier {
  bool loading = false;
  bool isPasswordValidate = false;
  bool hasError = false;
  String errorMessage;

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  void setIsValidated(value) {
    isPasswordValidate = value;
    notifyListeners();
  }

  bool getIsValidated() {
    return isPasswordValidate;
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
