// user_provider.dart

import 'package:annafi_app/presentation_layer/features/profile_page/profile_repo.dart';
import 'package:flutter/material.dart';
import '../../../data_layer/models/profile_model.dart';

class ProfileProvider with ChangeNotifier {

  final UserRepository _userRepository;
  ProfileProvider(this._userRepository);
  ProfileModel? _userModel;
  ProfileModel? get userModel => _userModel;

  Future<void> fetchUserInfo() async {
    
    try {
      _userModel = await _userRepository.getUserInfo();
      notifyListeners();
    } catch (e) {
      // Handle error
      print(e.toString());
    }
  }
}
