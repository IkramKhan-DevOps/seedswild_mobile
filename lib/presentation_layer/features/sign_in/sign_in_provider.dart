import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/error_handling/app_errors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/models/user_model.dart';
import '../user_session/statemanagement/user_provider.dart';
import 'sign_in_repo.dart';

class SignInProvider with ChangeNotifier {

  // attributes
  final _mySignInRepo = SignInRepo();
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
  Future<void> apiCall(dynamic data, BuildContext context) async {
    setLoading(true);

    _mySignInRepo.signInApi(data).then((value) {
      setLoading(false);

      final userTokenSave = Provider.of<UserProvider>(context, listen: false);
      userTokenSave.saveUser(UserModel(key: value['key'].toString()));
      ErrorMessage.flushBar(context, "Logged in Successfully");
      Navigator.popAndPushNamed(context, AppRoutes.homePage);

    }).onError((error, stackTrace) {
        setLoading(false);
        ErrorMessage.flushBar(context, error.toString(), "danger");
      },
    );
  }
}
