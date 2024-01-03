import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          padding: getPadding(
            left: 16,
            top: 14,
            right: 16,
            bottom: 14,
          ),
          decoration: AppDecoration.fillGray10001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                  this.IconName
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  this.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtPoppinsRegular16,
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded
              )
            ],
          ),
        ),
      ),
    );
  }
}
