import 'package:seedswild/services/products/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductCategoryCardList extends StatelessWidget {
  final categoryList;

  const ProductCategoryCardList({super.key, this.categoryList});

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
                  return ProductCategoryCardItem(
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

class ProductCategoryCardItem extends StatelessWidget {
  final String id;
  final String name;
  final String? image;
  final VoidCallback? onTap;

  ProductCategoryCardItem(
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
        context.read<ProductsProvider>().setCategory(id);
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
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(26.5),
                border: Border.all(
                  color: context.watch<ProductsProvider>().category == id ? Colors.green : Colors.white,
                ),
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
          Text(name),
        ],
      ),
    );
  }
}
