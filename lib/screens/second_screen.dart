import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/screens/widgets/app_bar.dart';
import 'package:sampleui/screens/widgets/bottom_nav_bar.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Image.asset(
                backgroundImage,
                height: size.height * 0.4,
                width: size.width,
                fit: BoxFit.cover,
              ),
              const AppBarWidget(isTitleShow: false),
              Positioned.fill(
                top: size.height * 0.35,
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Image.asset(
                                imageShopp,
                                width: 90.0,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: Image.asset(
                                imageCar,
                                width: 90.0,
                              ),
                              onTap: () {},
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
                      const SizedBox(height: 20.0),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: (itemWidth / itemHeight),
                          controller: ScrollController(keepScrollOffset: false),
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16.0),
                          crossAxisCount: 3,
                          children: <Widget>[
                            _gridItem(imageWash, "Car wash and cleaning"),
                            _gridItem(imageMech, "Mechanical work"),
                            _gridItem(imagePolish, "Polishing work"),
                            _gridItem(imageDetail, "Detailing services"),
                            _gridItem(
                                imageBike, "Bike wash and other services"),
                            _gridItem(imageHouse, "House Keeping"),
                          ],
                        ),
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _gridItem(String image, String title) {
    return Column(
      children: [
        Container(
          child: Image.asset(image, width: 64.0),
          decoration: BoxDecoration(
            color: colorCircle,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        const SizedBox(height: 5.0),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 12.0, height: 1.2),
          ),
        )
      ],
    );
  }
}
