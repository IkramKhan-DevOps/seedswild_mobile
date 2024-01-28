import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/data_layer/models/home_products_model.dart';
import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
              itemExtent: 80,
              itemBuilder: (context, index) {
                dynamic category = categoryList[index];
                if (category != null) {
                  return CategoryCardItem(
                    id: category.id.toString(),
                    name: category.name,
                    image: category.thumbnailImage,
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
      required this.image,
      required this.onTap})
      : super();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        context.read<ProductsProvider>().category = id.toString();
        Navigator.pushNamed(context, AppRoutes.productsScreen);
      },
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
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(26.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ClipOval(
                  child: Image.network(
                    image ?? "https://picsum.photos/50",
                    width: 58,
                    height: 58,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const SizedBox(height: 6),
          Text(name, maxLines: 1, style: GoogleFonts.aBeeZee(fontSize: 12), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
