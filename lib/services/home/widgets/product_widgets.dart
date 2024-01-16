import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:flutter/material.dart';

class ProductCardList extends StatelessWidget {
  final productList;
  const ProductCardList({super.key, this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      // OVERALL SIZED BOX SIZE
      height: 250,
      // ----------------------

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(width: 8.h);
        },
        itemCount: productList.length,
        itemBuilder: (context, index) {
          dynamic product = productList[index];
          return ProductCardItem(
            id: product.id.toString(),
            name: product.title,
            image: product.thumbnailImage,
            price: product.price.toString(),
            discount: product.discount.toString(),
            category: product.category.name,
          );
        },
      ),
    );
  }
}

class ProductCardItem extends StatelessWidget {
  final String id;
  final String name;
  final String? image;
  final String price;
  final String discount;
  final String category;

  ProductCardItem({
    super.key, required this.id, required this.name, this.image,
    required this.price, required this.discount, required this.category
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, AppRoutes.productDetailScreen, arguments: id);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[200],
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
                category,
                maxLines: 2,
                style: GoogleFonts.aBeeZee(
                  color: Colors.green,
                ),

              ),
              Text(
                name,
                maxLines: 3,
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "$price\$",
                    style: GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "$discount\$",
                    style: GoogleFonts.aBeeZee(
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
