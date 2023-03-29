
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:paytr_case/components/app_dialog.dart';
import 'package:paytr_case/shared/functions.dart';



class NetworkManager {
  late Dio dio;
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    dio = Dio();
    dio.options.contentType = 'application/json';
    dio.options.baseUrl;// baseUrl yok;
    dio.options.headers = {
      'Accept': 'application/json',
    };


    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) async {
        log("${e.requestOptions.path} => ${e.response?.statusCode ?? ""} => ${(e.response?.data ?? "")}");



   
          Map<String, dynamic>? data =
              e.response == null ? null : responseToMap(e.response!);
          if (data?.containsKey("message") ?? false) {
            AppDialog.show(content: data!['message'],title: "HATA",buttonOkText: "Tamam");
          } else {
            
              AppDialog.show(content: "Bilinmeyen bir hata Oluştu",title: "HATA",buttonOkText: "Tamam");
          
          }
        

        handler.next(e);
      },
      onRequest: (req, handler) async {
        if (kDebugMode) {
          print("${req.path} = ${req.data}");
        }




        handler.next(req);
      },
      onResponse: (e, handler) {
        log("${e.requestOptions.baseUrl}${e.requestOptions.path} ${e.data == null ? "" : jsonEncode(responseToMap(e))}");
        handler.next(e);
      },
    ));
  }
}


