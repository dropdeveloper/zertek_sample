import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/screens/widgets/app_bar.dart';
import 'package:sampleui/screens/widgets/dot_indicator.dart';
import 'package:sampleui/utils/route.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Image.asset(
                appBarImage,
                height: size.height * 0.5,
                fit: BoxFit.cover,
              ),
              const AppBarWidget(),
              Positioned(
                top: size.height * 0.32,
                child: Container(
                  width: size.width,
                  height: 90.0,
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.black.withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            carIcon,
                            width: 64.0,
                          ),
                          const SizedBox(width: 16.0),
                          Container(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 4.0),
                            child: Text(
                              "Enter car details >>",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)),
                          ),
                        ],
                      ),
                      const DotIndicator(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.42,
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Image.asset(
                                homeCategorieIcon1,
                                width: 90.0,
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Image.asset(
                                  homeCategorieIcon2,
                                  width: 90.0,
                                ),
                                onTap: () {
                                  Navigator.push(context, secondScreen);
                                },
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                homeCategorieIcon3,
                                width: 90.0,
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                homeCategorieIcon4,
                                width: 90.0,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shoppe",
                            style: GoogleFonts.poppins(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "more >",
                            style: GoogleFonts.poppins(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: EdgeInsets.zero,
                        crossAxisCount: 3,
                        children: <Widget>[
                          Image.asset(
                            homeP1,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            homeP2,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            homeP4,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            homeP1,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            homeP5,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            homeP6,
                            width: size.width,
                            fit: BoxFit.fill,
                          ),
                        ],
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
