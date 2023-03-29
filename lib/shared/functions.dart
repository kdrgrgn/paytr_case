import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:paytr_case/main.dart';


void addPostFrameCallback(Function callback) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

  if (FocusScope.of(appKey.currentContext!).hasFocus) {
    FocusScope.of(appKey.currentContext!).unfocus();
  }
}

Map<String, dynamic> responseToMap(Response response) {
  try {
    return response.data is String ? jsonDecode(response.data) : response.data;
  } catch (e) {
    return {};
  }
}



