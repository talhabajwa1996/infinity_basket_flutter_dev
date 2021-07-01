import 'package:flutter/cupertino.dart';
import 'package:infinity_basket_app_dev/Models/OtpPasswordModel/OtpPasswordResponseModel.dart';
import 'package:quiver/async.dart';

class OtpPasswordProvider extends ChangeNotifier {
  bool hasError = false;
  String errorMessage;
  int start, current;
  bool isVisible = true;
  var sub;

  OtpPasswordResponseModel _otpResponse;
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value, {bool notify = true}) {
    _loading = value;
    if (notify) {
      notifyListeners();
    }
  }

  OtpPasswordResponseModel get otpResponse => _otpResponse;

  set setOtpResponse(OtpPasswordResponseModel otpResponse) {
    _otpResponse = otpResponse;
    notifyListeners();
  }

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
