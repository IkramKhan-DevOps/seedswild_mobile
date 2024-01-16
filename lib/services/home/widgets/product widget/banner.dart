import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({
    Key? key,
    required this.saleName,
    required this.onTap,
    required this.buttonTextName,
  }) : super(key: key);

  final String saleName;
  final String buttonTextName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          saleName,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: GoogleFonts.aBeeZee(
            color: SeedsColor.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.more_horiz,
            color: SeedsColor.primary,
            size: 24,
          ),
        ),
      ],
    );
  }
}
