import 'package:annafi_app/data_layer/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WhoIAm {

  static void saveUser({required ProfileModel profileModel}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("pk", profileModel.pk.toString());
      sharedPreferences.setString("email", profileModel.email);
      sharedPreferences.setString("firstName", profileModel.firstName);
      sharedPreferences.setString("lastName", profileModel.lastName);
    } catch (error) {
      print(error.toString());
    }
  }

  static Future<ProfileModel?> getUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      return ProfileModel(
        pk: int.parse(preferences.getString('pk').toString()) ?? 1,
        email: preferences.getString('email').toString() ?? "",
        firstName: preferences.getString('firstName').toString() ?? "",
        lastName: preferences.getString('lastName').toString() ?? "",
      );
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  static Future<void> removeUser() async {

    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

      sharedPreferences.remove("pk");
      sharedPreferences.remove("email");
      sharedPreferences.remove("firstName");
      sharedPreferences.remove("lastName");

    } catch (error) {
      print(error.toString());
    }

  }
}
