// user_provider.dart

import 'package:annafi_app/presentation_layer/features/profile_page/profile_repo.dart';
import 'package:flutter/material.dart';
import '../../../data_layer/models/profile_model.dart';
import '../../../data_layer/urls/app_urls.dart';

class ProfileProvider with ChangeNotifier {

  final UserRepository _userRepository = UserRepository(AppUrls.profile);
  late ProfileModel? _userModel;
  bool isLoading = true;

  ProfileModel? get userModel => _userModel;

  Future<void> fetchUserInfo() async {

    try {
      _userModel = await _userRepository.getUserInfo();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
      isLoading = false;
    }
  }
}
