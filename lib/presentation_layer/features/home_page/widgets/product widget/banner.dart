import 'package:seedswild/utils/theme/app_stylea.dart';
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
          style: AppStyle.txtPoppinsMedium18Black900,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            buttonTextName, // Assuming you want a fixed text here
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsMedium14MainGreenColor,
          ),
        ),
      ],
    );
  }
}
