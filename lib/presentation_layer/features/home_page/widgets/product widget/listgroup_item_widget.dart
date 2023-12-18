import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../statemanagement/categories_provider.dart';

class ListgroupItemWidget extends StatefulWidget {
  final String imagePath;
  final String categoryName;
  final VoidCallback onTap;

  ListgroupItemWidget({
    required this.imagePath,
    required this.categoryName,
    required this.onTap,
  });

  @override
  State<ListgroupItemWidget> createState() => _ListgroupItemWidgetState();
}

class _ListgroupItemWidgetState extends State<ListgroupItemWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriesProvider>(context, listen: false)
        .fetchProductCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            height: 53,
            width: 53,
            decoration: BoxDecoration(
              color: const Color(0xffF6F6F6),
              borderRadius: BorderRadius.circular(26.5),
            ),
            child: ClipOval(
              child: Image.network(
                widget.imagePath,
                width: 58,
                height: 58,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const SizedBox(height: 6),
        Text(widget.categoryName),
      ],
    );
  }
}
