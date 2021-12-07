import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sampleui/utils/utils.dart';

class InternetHelper {
  late Future initialized;
  Map<String, String> headers = <String, String>{};

  InternetHelper() {
    initialized = _init();
  }

  _init() async {
    headers['Accept'] = "application/json";
    headers['Content-type'] = "application/json";
  }

  Future<Response> getRequest(
      String url, Map<String, dynamic> params, context) async {
    try {
      String paramsString = '';
      String separator = '?';
      params.forEach((key, value) {
        paramsString = '$paramsString$separator$key=$value';
        separator = '&';
      });
      final response =
          await http.get(Uri.parse(url + paramsString), headers: headers);
      return response;
    } catch (e) {
      showMessage("Internal error $e", Colors.red, context);
      throw Exception(e.toString());
    }
  }
}

InternetHelper internetService = InternetHelper();
