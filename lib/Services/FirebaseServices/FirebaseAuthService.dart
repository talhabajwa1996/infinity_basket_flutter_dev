import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infinity_basket_app_dev/Components/SnackBar/showSnackBar.dart';
import 'package:infinity_basket_app_dev/Models/SignInModel/SignInResponseModel.dart';
import 'package:infinity_basket_app_dev/Providers/SignInProvider/SignInProvider.dart';
import 'package:infinity_basket_app_dev/Services/API/api_response.dart';
import 'package:infinity_basket_app_dev/Services/AuthServices/SignInService.dart';
import 'package:provider/provider.dart';

class FirebaseAuthService {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<ApiResponse<SignInResponseModel>> signInWithGoogle(
      BuildContext context) async {
    try {
      Provider.of<SignInProvider>(context, listen: false).setLoading(true);
      SignInResponseModel signedInUser;
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        User firebaseAuthUser = userCredential.user;
        List<String> firstAndLastName = firebaseAuthUser.displayName.split(" ");
        String firstName = firstAndLastName.first;
        String lastName =
            firstAndLastName.length > 1 ? firstAndLastName.last : "";
        String email = firebaseAuthUser.email;
        await SignInService()
            .loginUserWithGmailCredentials(firstName, lastName, email, context)
            .then((signInResponseModel) =>
                signedInUser = signInResponseModel.responseData);
      }
      Provider.of<SignInProvider>(context, listen: false).setLoading(false);
      return ApiResponse.completed(signedInUser);
    } catch (e) {
      Provider.of<SignInProvider>(context, listen: false).setLoading(false);
      showSnackBar("Unable to Login with Google", context);
      return ApiResponse.error(e);
    }
  }
}
