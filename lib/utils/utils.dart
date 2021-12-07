import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showMessage(String message, Color colorBackground, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: colorBackground,
      content: Text(message, style: GoogleFonts.poppins())));
}

Future<bool> isConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}
