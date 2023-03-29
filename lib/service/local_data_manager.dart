import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paytr_case/main.dart';
import 'package:paytr_case/model/user/user.dart';

class LocalDataManager {
  static Future<User?> getUser() async {
    try {
      String data = await DefaultAssetBundle.of(appKey.currentContext!)
          .loadString("assets/user_data.json");

      return User.fromJson(jsonDecode(data) as Map<String, dynamic>);
    } catch (e) {
      return null;
    }
  }
}
