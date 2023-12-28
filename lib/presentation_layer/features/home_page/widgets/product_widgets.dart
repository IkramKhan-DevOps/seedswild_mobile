import 'package:annafi_app/core/app_export.dart';
import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  final productList;
  const ProductCardList({super.key, this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 8.h);
        },
        itemCount: productList.length,
        itemBuilder: (context, index) {
          dynamic product = productList[index];
          return ProductCardItem(
            name: product.title,
            image: product.thumbnailImage,
            price: product.price.toString(),
            discount: product.discount.toString(),
            onTap: () => Navigator.pushNamed(context, AppRoutes.productViewScreen),
          );
        },
      ),
    );
  }
}

class ProductCardItem extends StatelessWidget {
  final String name;
  final String? image;
  final String price;
  final String discount;
  final VoidCallback? onTap;

  ProductCardItem({
    super.key, required this.name, this.image,
    required this.price, required this.discount, required this.onTap
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(this.image ?? "https://picsum.photos/200"),
              ),
              SizedBox(height: 10),

              // TEXT
              Text(
                name,
                maxLines: 3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "$price\$",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "$discount\$",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
