import 'package:annafi_app/core/utils/color_constant.dart';
import 'package:annafi_app/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.height,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(key: key);

  final double height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(0)),
      child: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: height,
        backgroundColor: Colors.transparent,
        flexibleSpace: _getStyle(),
        leadingWidth: leadingWidth ?? 0,
        leading: leading,
        title: title,
        titleSpacing: 0,
        centerTitle: centerTitle ?? false,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        size.width,
        height,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadowBlack90019:
        return Container(
          height: getVerticalSize(
            69,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                getHorizontalSize(
                  24,
                ),
              ),
              bottomRight: Radius.circular(
                getHorizontalSize(
                  24,
                ),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorConstant.black90019,
                spreadRadius: getHorizontalSize(
                  2,
                ),
                blurRadius: getHorizontalSize(
                  2,
                ),
                offset: const Offset(
                  0,
                  4,
                ),
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadowBlack90019,
}
