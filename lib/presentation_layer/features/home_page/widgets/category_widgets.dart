import 'package:annafi_app/core/app_export.dart';
import 'package:annafi_app/data_layer/models/home_products_model.dart';
import 'package:flutter/material.dart';

class CategoryCardList extends StatelessWidget {
  final categoryList;

  const CategoryCardList({super.key, this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length ?? 0,
              itemBuilder: (context, index) {
                dynamic category = categoryList[index];
                if (category != null) {
                  return CategoryCardItem(
                    id: category.id.toString(),
                    name: category.name,
                    onTap: () {},
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  final String id;
  final String name;
  final String? image;
  final VoidCallback? onTap;

  CategoryCardItem(
      {super.key,
      required this.id,
      required this.name,
      this.image,
      required this.onTap})
      : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
                  "https://picsum.photos/50",
                  width: 58,
                  height: 58,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const SizedBox(height: 6),
          Text(name),
        ],
      ),
    );
  }
}
