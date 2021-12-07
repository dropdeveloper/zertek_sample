import 'package:flutter/material.dart';
import 'package:sampleui/helper/internet_helper.dart';
import 'package:sampleui/utils/app_constant.dart';
import 'package:sampleui/utils/utils.dart';
import 'package:http/http.dart';

class ApiHelper {
  //request phone verification code api
  void verification(context, String phone) async {
    //init http request own class
    await internetService.initialized;
    //check internet connection both wifi and mobile data
    isConnected().then((value) async {
      if (value) {
        var _data = <String, String>{"phone": phone};
        Response _response = await internetService.getRequest(
            phoneVerificationUrl, _data, context);
        print(_response.body);
        if (_response.statusCode == 200) {
          //success request
          //wite if success what happed here
        }
        showMessage(
            "Internal error ${_response.statusCode}", Colors.red, context);
      } else {
        showMessage(
            "Opps ! Internet connection invalid. Please check your connection!",
            Colors.red,
            context);
      }
    });
  }
}
