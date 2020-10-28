import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shofri/api/api.dart';
import 'package:shofri/models/user.dart';

class UserProvider with ChangeNotifier {
  User _user;
  User get user => _user;

  bool get isLoggedIn => _user != null;

  getGuestToken() async {
    final response = await Dio().post(
      "https://www.shofri.in/appinshofri/token/generate.php",
      data: ({
        "username": "admin",
        "password": "admin123",
      }),
    );

    if (response?.statusCode == 200) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      if (sp.containsKey("access_token")) {
        await sp.remove("access_token");
      }
      String accessToken = response.data["document"]["access_token"];
      await sp.setString("access_token", accessToken);
      notifyListeners();
      return;
    }
  }

  register(String username, String password) async {
    // final response = await api.post(
    //   "users/create.php",
    // );
  }
}
