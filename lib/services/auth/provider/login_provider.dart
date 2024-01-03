import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/globals/utils/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../data_layer/data/network/base_api_services.dart';
import '../../../../data_layer/data/network/network_api_services.dart';
import '../../../../data_layer/urls/app_urls.dart';


// GOOGLE SETTINGS
List<String> scopes = <String>['email'];
GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "370944119419-lcf8s0uj0uhe74cckc2kt9sbekg17lm7.apps.googleusercontent.com",
  scopes: scopes,
);


class LoginProvider with ChangeNotifier {

  // attributes
  BaseApiService apiServices = NetworkApiService();
  bool _loading = false;
  bool _obSecure = true;

  // getters
  bool get loading => _loading;
  bool get obSecure => _obSecure;

  // setters
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setObSecure() {
    _obSecure = !_obSecure;
    notifyListeners();
  }

  // API CALL
  Future<void> loginAPI(dynamic data, BuildContext context) async {

    print("loginAPI");
    print(AppUrls.signIn);
    handleSignOut();

    setLoading(true);
    try {

      var response = await apiServices.postAPI(AppUrls.signIn, data);
      AuthToken.saveToken(response['key']);
      setLoading(false);
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);

    } catch (error) {
      throw error;
    }finally{
      setLoading(false);
    }

  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  Future<void> handleGoogleSignIn(BuildContext context) async {
    handleSignOut();
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final String accessToken = googleSignInAuthentication.accessToken ?? '';
        final String idToken = googleSignInAuthentication.idToken ?? '';


        handleGoogleLoginServer(context, accessToken, idToken);
      }
    } catch (error) {
      ErrorMessage.flushBar(context, error.toString(), "danger");
    }
  }

  Future<void> handleGoogleLoginServer(BuildContext context, String accessToken, String idToken) async{
    Map data = {
      "access_token": accessToken,
      "code": "",
      "id_token": idToken
    };

    setLoading(true);
    try{
      var response = await apiServices.postAPI(AppUrls.signInGoogle, data);
      AuthToken.saveToken(response['key']);
      setLoading(false);
      Navigator.pushReplacementNamed(context, AppRoutes.homePage);

    } catch (error) {
      ErrorMessage.flushBar(context, error.toString(), "danger");
    }
    finally{
      setLoading(false);
    }
  }

}


