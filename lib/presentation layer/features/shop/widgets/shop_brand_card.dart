import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  CategoryCard({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 80,
                width: 90,
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 90,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.white,
                      Color.fromARGB(255, 198, 200, 203),
                    ],
                    center: Alignment(0, 0),
                    radius: 0.8,
                    focal: Alignment(0, 0),
                    focalRadius: 0.1,
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Image.asset(image),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
