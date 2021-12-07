import 'package:flutter/material.dart';
import 'package:sampleui/app.dart';
import 'package:sampleui/screens/login.dart';
import 'package:sampleui/screens/phone_verification.dart';
import 'package:sampleui/screens/second_screen.dart';

final secondScreen =
    MaterialPageRoute(builder: (context) => const SecondScreen());

final loginScreen = MaterialPageRoute(builder: (context) => const Login());

final homeScreen = MaterialPageRoute(builder: (context) => const App());

dynamic phoneVerificationScreen(String phone) {
  return MaterialPageRoute(
      builder: (context) => PhoneVerification(phone: phone));
}
