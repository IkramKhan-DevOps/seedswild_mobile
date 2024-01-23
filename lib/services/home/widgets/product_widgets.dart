import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:seedswild/core/constants/colors.dart';

class ProductCardList extends StatelessWidget {
  final productList;
  const ProductCardList({super.key, this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      // OVERALL SIZED BOX SIZE
      height: 260,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                child: Image.network(this.image ?? "https://picsum.photos/200"),
              ),

              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  category,
                  maxLines: 2,
                  style: GoogleFonts.aBeeZee(
                    color: SeedsColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  name,
                  maxLines: 3,
                  style: GoogleFonts.aBeeZee(),
                ),
              ),

              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Row(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
