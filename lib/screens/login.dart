import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/utils/route.dart';
import 'package:sampleui/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _phoneEditController = TextEditingController();

  @override
  void dispose() {
    _phoneEditController.dispose();
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
                    "Login with phone number",
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
                      controller: _phoneEditController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        // contentPadding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                        prefixIcon: Icon(
                          Icons.phone_iphone_outlined,
                          color: Colors.white,
                        ),
                        counterText: "",
                      ),
                      maxLength: 10,
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
                          if (_phoneEditController.text.isNotEmpty ||
                              _phoneEditController.text.length > 9) {
                            Navigator.push(
                                context,
                                phoneVerificationScreen(
                                    _phoneEditController.text));
                          } else {
                            showMessage(
                                "Enter your valid 10 digit phone number",
                                Colors.red,
                                context);
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
