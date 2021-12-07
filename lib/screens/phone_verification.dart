import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/helper/api_helper.dart';
import 'package:sampleui/utils/route.dart';
import 'package:sampleui/utils/utils.dart';

class PhoneVerification extends StatefulWidget {
  final String phone;
  const PhoneVerification({Key? key, required this.phone}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  Timer? _timer;
  int _start = 60;
  final _codeEditController = TextEditingController();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  //send request phone veri. code
  void _verification(context) {
    ApiHelper().verification(context, widget.phone.trim());
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    _codeEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            carImage,
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.black54,
                  Colors.black,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your verification code",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    child: TextField(
                      autofocus: true,
                      controller: _codeEditController,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          suffixText: "$_start",
                          suffixStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 18.0),
                          counterText: "",
                          contentPadding: const EdgeInsets.only(right: 16.0)),
                      maxLength: 6,
                      style: GoogleFonts.poppins(
                        fontSize: 18.0,
                        color: Colors.white,
                        letterSpacing: 0.8,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "login_btn",
                      child: MaterialButton(
                        onPressed: () {
                          if (_codeEditController.text.isNotEmpty ||
                              _codeEditController.text.length > 5) {
                            //function request
                            _verification(context);
                            // api bypass
                            Navigator.pushAndRemoveUntil(
                                context, homeScreen, (route) => false);
                          } else {
                            showMessage("Enter valid verification code",
                                Colors.red, context);
                          }
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                          child: Text(
                            "Continue",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              letterSpacing: 0.8,
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        splashColor: Colors.amber,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
