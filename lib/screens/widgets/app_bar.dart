import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleui/data/image_source.dart';
import 'package:sampleui/screens/widgets/search_field.dart';

class AppBarWidget extends StatelessWidget {
  final bool? isTitleShow;
  const AppBarWidget({Key? key, this.isTitleShow = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: isTitleShow!
            ? Text(
                "Car shoppe",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 26.0,
                  letterSpacing: 0.8,
                ),
              )
            : Container(),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            slideBarIcon,
            width: 22.0,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
        bottom: const PreferredSize(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0),
            child: SearchField(),
          ),
          preferredSize: Size(0, 100),
        ),
      ),
    );
  }
}
