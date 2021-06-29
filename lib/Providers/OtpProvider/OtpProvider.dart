import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quiver/async.dart';

class OtpProvider with ChangeNotifier {
  bool loading = false;
  bool hasError = false;
  String errorMessage;
  int start, current;
  bool isVisible = true;
  var sub;

  void startTimer() {
    sub?.cancel();
    isVisible = false;
    hasError = false;
    start = 15;
    current = 15;
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: start),
      new Duration(seconds: 1),
    );
    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      current = start - duration.elapsed.inSeconds;
      notifyListeners();
    });
    sub.onDone(() {
      isVisible = true;
      sub.cancel();
      notifyListeners();
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }

  bool isValidated() {
    return hasError;
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
