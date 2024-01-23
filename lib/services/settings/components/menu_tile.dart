import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/constants/colors.dart';

import '../../../../core/utils/size_utils.dart';
import '../../../../utils/theme/app_decoration.dart';
import '../../../../utils/theme/app_stylea.dart';

class MenuTile extends StatelessWidget {

  final String title;
  final IconData IconName;
  final VoidCallback onTap;

  MenuTile(this.title, this.IconName, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            border: Border(
              bottom: BorderSide(
                width: 1, style: BorderStyle.solid,
                color: Colors.white70
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                  this.IconName,
                size: 18, color: Colors.grey[700],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  this.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 15,
                    color: Colors.grey[700]
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                size: 18, color: Colors.grey[700],
              )
            ],
          ),
        ),
      ),
    );
  }
}
