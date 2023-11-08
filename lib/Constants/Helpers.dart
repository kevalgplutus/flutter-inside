

import 'dart:convert';

import 'package:inside/User/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helpers {

  static Future<bool> getUserId()  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_id') != '') {
      return true;
    }
    return false;
  }

  static Future<UserModel> getFullUserData() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? response = prefs.getString("user");
      final modelObj = json.decode(response!);
      return UserModel.fromJson(modelObj);
  }

  static void saveDataIntoSharedPrefference(UserModel objUserModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", json.encode(objUserModel));
  }

  static void removeDataFromSharedPrefference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}

