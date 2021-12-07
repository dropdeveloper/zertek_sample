import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.0,
      padding: const EdgeInsets.fromLTRB(0.0, 5, 0.0, 5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          itemMenu("Home", homeIcon),
          itemMenu("Share", shareIcon),
          itemMenu("Profile", profileIcon),
          itemMenu("History", historyIcon),
          itemMenu("Coins", coinIcon, isActive: true),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.amberAccent.withOpacity(0.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          )),
    );
  }

  Widget itemMenu(String name, String image, {bool isActive = false}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
          child: Image.asset(
            image,
            height: 32.0,
          ),
          decoration: BoxDecoration(
            color:
                isActive ? Colors.amber.withOpacity(0.5) : Colors.transparent,
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        // const SizedBox(height: 5.0),
        Flexible(child: Text(name, style: GoogleFonts.poppins(fontSize: 12.0))),
      ],
    );
  }
}
