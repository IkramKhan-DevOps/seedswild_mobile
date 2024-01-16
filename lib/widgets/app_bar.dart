import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MAppBar extends StatelessWidget {
  final String title;
  final bool? isBack;
  const MAppBar({super.key, required this.title, this.isBack = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.green,
      title: Text(title, style: TextStyle(color: Colors.white)),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }
}


class SeedsAppBar extends StatelessWidget {
  final String title;
  final bool? isBack;
  const SeedsAppBar({super.key, required this.title, this.isBack = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(title, style: GoogleFonts.aBeeZee(color: Colors.black)),
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }
}
