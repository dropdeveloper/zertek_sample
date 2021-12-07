import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/utils/route.dart';

class SplashIntro extends StatelessWidget {
  const SplashIntro({Key? key}) : super(key: key);

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
          Positioned(
            bottom: 100.0,
            child: SizedBox(
              width: size.width,
              child: Text(
                "Proceed with your Login",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            child: SizedBox(
              width: size.width,
              child: Center(
                child: Hero(
                  tag: "login_btn",
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context, loginScreen, (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 8.0),
                      child: Text(
                        "LOGIN",
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
            ),
          )
        ],
      ),
    );
  }
}
