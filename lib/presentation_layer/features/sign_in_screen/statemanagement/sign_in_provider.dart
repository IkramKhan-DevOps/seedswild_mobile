import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/models/user_model.dart';
import 'package:annafi_app/presentation_layer/features/user_session/statemanagement/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/custom show messages/flush_bar_message_component.dart';
import '../repository/sign_in_repo.dart';

class SignInProvider with ChangeNotifier {

  final _mySignInRepo = SignInRepo();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obsecure = true;
  bool get obsecure => _obsecure;
  setObsecure() {
    _obsecure = !_obsecure;
    notifyListeners();
  }

  Future<void> SignInApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _mySignInRepo.signInApi(data).then((value) {
      setLoading(false);
      final userTokenSave = Provider.of<UserProvider>(context, listen: false);
      userTokenSave.saveUser(UserModel(key: value['key'].toString()));
      CustomFlushBarMessage.flushbarErrorMessage(
          iconData: Icons.check,
          "Sign In",
          ColorConstant.mainGreenColor,
          'Api Test',
          context
      );
      Navigator.pushNamed(context, AppRoutes.homePage);
    }).onError((error, stackTrace) {
      setLoading(false);
      CustomFlushBarMessage.flushbarErrorMessage(
          iconData: Icons.error,
          error.toString(),
          ColorConstant.mainGreenColor,
          "",
          context);
    });
  }
}

onTapHome(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homePage);
}
