import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paytr_case/main.dart';

class LocalDataManager {
  static Future<Map<String, dynamic>?> getJsonAsset() async {
    try {
      String data = await DefaultAssetBundle.of(appKey.currentContext!)
          .loadString("assets/user_data.json");

      return jsonDecode(data) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
