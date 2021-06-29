import 'package:flutter/foundation.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SignInResponseModel.dart';

class SignInProvider with ChangeNotifier {
  bool loading = false;
  bool isValidate = false;
  bool hasError = false;
  String errorMessage;
  String _loginPlatform;
  bool isObscureText = true;
  SignInResponseModel _signInResponse;

  String get loginPlatform => _loginPlatform;


  SignInResponseModel get signInResponse => _signInResponse;

  set setSignInResponse(SignInResponseModel signUpResponse) {
    _signInResponse = signUpResponse;
    notifyListeners();
  }
    setPasswordObscure() {
      isObscureText = !isObscureText;
      notifyListeners();
    }

    void setLoading(value) {
      loading = value;
      notifyListeners();
    }

    bool isLoading() {
      return loading;
    }

    void setIsValidated(value) {
      isValidate = value;
      notifyListeners();
    }

    bool getIsValidated() {
      return isValidate;
    }

    void setError(value) {
      hasError = value;
      notifyListeners();
    }

    bool getError() {
      return hasError;
    }

    void setLoginPlatform(String text) {
      _loginPlatform = text;
      notifyListeners();
    }

    void setMessage(value) {
      errorMessage = value;
      notifyListeners();
    }

    String getMessage() {
      return errorMessage;
    }

    // setAuthResponseData(AuthResponse authResponse) {
    //   _authResponse = authResponse;
    // }
    //
    // AuthResponse getAuthResponseData() {
    //   return _authResponse;
    // }
    //
    // signIn(context, String contactNumber, String password) async {
    //   try {
    //     setLoading(true);
    //     await _signInService
    //         .getAuthData(context, contactNumber, password)
    //         .then((response) {
    //       setLoading(false);
    //       if (response.isSuccessful) {
    //         if (response.authData.addresses.isNotEmpty) {
    //           setUserAddress(response, context);
    //         }
    //         setIsValidated(false);
    //
    //         AppLocalData()
    //             .setStringPrefValue('firstName', response.authData.firstName);
    //         AppLocalData()
    //             .setStringPrefValue('lastName', response.authData.lastName);
    //         Provider.of<LocalDataProvider>(context, listen: false)
    //             .setTokenValue(response.authData.authToken);
    //         Provider.of<LocalDataProvider>(context, listen: false)
    //             .setSocialUsername("");
    //         Provider.of<LocalDataProvider>(context, listen: false)
    //             .setUserPreference("appLogin");
    //         Provider.of<LocalDataProvider>(context, listen: false)
    //             .setProfileImage(response.authData.profileImage);
    //         Provider.of<NotificationProvider>(context, listen: false)
    //             .setNotificationCount(response.authData.notificationCount);
    //         Provider.of<AddToCartProvider>(context, listen: false)
    //             .setCartCounterValue(response.authData.allCartsItemCount,
    //             response.authData.allActiveCartsCount);
    //         AppNavigation().goBack();
    //       } else {
    //         setMessage(response.message.toString());
    //         setIsValidated(true);
    //         setError(true);
    //       }
    //     });
    //   } catch (e) {
    //     customShowToast(e.toString(), color: ColorConstants.secondaryColor);
    //     setLoading(false);
    //   }
    // }
    //
    // Future signInGoogle(context) async {
    //   try {
    //     setLoading(true);
    //     final user = await _googleSignIn.signIn();
    //     if (user == null) {
    //       setLoading(false);
    //       return;
    //     } else {
    //       final googleAuth = await user.authentication;
    //       setLoginPlatform("google");
    //       await _signInService
    //           .getAuthDataWithSocialLogin(
    //           context, loginPlatform, googleAuth.accessToken)
    //           .then((response) {
    //         setLoading(false);
    //         if (response.isSuccessful) {
    //           if (response.authData.addresses.isNotEmpty) {
    //             setUserAddress(response, context);
    //           }
    //           var localProvider =
    //           Provider.of<LocalDataProvider>(context, listen: false);
    //           localProvider.setTokenValue(response.authData.authToken);
    //           localProvider.setProfileImage(response.authData.profileImage);
    //           localProvider.setUserPreference("google");
    //           localProvider.setSocialUsername(response.authData.displayName);
    //           Provider.of<AddToCartProvider>(context, listen: false)
    //               .setCartCounterValue(response.authData.allCartsItemCount,
    //               response.authData.allActiveCartsCount);
    //           Provider.of<NotificationProvider>(context, listen: false)
    //               .setNotificationCount(response.authData.notificationCount);
    //           AppNavigation().goBack();
    //         } else {
    //           customShowToast(response.message.toString());
    //         }
    //       });
    //     }
    //   } catch (e) {
    //     setLoading(false);
    //     customShowToast(e.toString());
    //   }
    // }
    //
    // Future signInFaceBook(context) async {
    //   try {
    //     final result = await FacebookAuth.instance
    //         .login(permissions: ["email", "public_profile"]);
    //     setLoginPlatform("facebook");
    //     await _signInService
    //         .getAuthDataWithSocialLogin(
    //         context, loginPlatform, result.accessToken.token)
    //         .then((response) {
    //       setLoading(false);
    //       if (response.isSuccessful) {
    //         if (response.authData.addresses.isNotEmpty) {
    //           setUserAddress(response, context);
    //         }
    //         var localProvider =
    //         Provider.of<LocalDataProvider>(context, listen: false);
    //         localProvider.setTokenValue(response.authData.authToken);
    //         localProvider.setProfileImage(response.authData.profileImage);
    //         localProvider.setFacebookToken(result.accessToken.token);
    //         localProvider.setUserPreference("facebook");
    //         localProvider.setSocialUsername(response.authData.displayName);
    //         Provider.of<AddToCartProvider>(context, listen: false)
    //             .setCartCounterValue(response.authData.allCartsItemCount,
    //             response.authData.allActiveCartsCount);
    //         Provider.of<NotificationProvider>(context, listen: false)
    //             .setNotificationCount(response.authData.notificationCount);
    //         AppNavigation().goBack();
    //       } else {
    //         customShowToast(response.message.toString());
    //       }
    //     });
    //   } catch (e) {
    //     setLoading(false);
    //     customShowToast(e.toString());
    //   }
    // }
    //
    // Future refreshToken(context) async {
    //   try {
    //     DialogBuilder().showLoadingIndicator();
    //     _googleSignIn.isSignedIn().then((value) async {
    //       if (value) {
    //         final user = await _googleSignIn.signInSilently().catchError((ex) {
    //           customShowToast(ex.toString());
    //         });
    //         final gSA = await user.authentication;
    //         setLoginPlatform("google");
    //         print("refersh token : ${gSA.accessToken}");
    //         await _signInService
    //             .getAuthDataWithSocialLogin(
    //             context, loginPlatform, gSA.accessToken)
    //             .then((response) {
    //           setLoading(false);
    //           if (response.isSuccessful) {
    //             DialogBuilder().hideOpenDialog();
    //             if (response.authData.addresses.isNotEmpty) {
    //               setUserAddress(response, context);
    //             }
    //             var localDataProvider =
    //             Provider.of<LocalDataProvider>(context, listen: false);
    //             localDataProvider.setTokenValue(response.authData.authToken);
    //             localDataProvider.setProfileImage(response.authData.profileImage);
    //             localDataProvider.setUserPreference("google");
    //             localDataProvider.setSocialUsername(user.displayName);
    //             Provider.of<AddToCartProvider>(context, listen: false)
    //                 .setCartCounterValue(response.authData.allCartsItemCount,
    //                 response.authData.allActiveCartsCount);
    //             Provider.of<NotificationProvider>(context, listen: false)
    //                 .setNotificationCount(response.authData.notificationCount);
    //             AppNavigation().goBack();
    //           } else {
    //             customShowToast(response.message.toString());
    //           }
    //         });
    //       } else {
    //         customShowToast("Not Signed In");
    //       }
    //     });
    //   } catch (e) {
    //     setLoading(false);
    //     customShowToast(e.toString());
    //   }
    // }

    void signOutGoogle() async {
      // await _googleSignIn.signOut();
      // _googleSignIn.disconnect();
      // print("google logout");
    }

    void signOutFaceBook() async {
      // await _facebookSignIn.logOut();
      // print("facebook logout");
    }

    // void setUserAddress(AuthResponse response, context) {
    //   Provider.of<UserLocationProvider>(context, listen: false).setUserAddress(
    //       response.authData.primaryAddress.adressLine,
    //       response.authData.primaryAddress.area,
    //       true,
    //       response.authData.primaryAddress.latlong,
    //       response.authData.primaryAddress.country,
    //       response.authData.primaryAddress.city,
    //       addressType: response.authData.primaryAddress.type,
    //       buildingName: response.authData.primaryAddress.buildingName,
    //       buildingBlock: response.authData.primaryAddress.buildingBlockVilaOffice,
    //       contactNumber: response.authData.primaryAddress.contactNumber,
    //       flatNumber: response.authData.primaryAddress.officeOrFlatNumber,
    //       floorNumber: response.authData.primaryAddress.floorNumber,
    //       landMark: response.authData.primaryAddress.landmark,
    //       preferredTime: response.authData.primaryAddress.preferedDeliveryTime,
    //       preferredType:
    //       response.authData.primaryAddress.preferedDeliveryTimeTitle);
    // }
}
