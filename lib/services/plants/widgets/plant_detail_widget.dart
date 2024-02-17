import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/colors.dart';

class PlantDetailWidget extends StatelessWidget {
  const PlantDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlantPropertyModel> plantProperties = [
      PlantPropertyModel(
        name: "Category",
        value: "Crops",
        image: "assets/plants/category.png",
      ),
      PlantPropertyModel(
        name: "Seasons",
        value: "Summer, Spring",
        image: "assets/plants/seasons.png",
      ),
      PlantPropertyModel(
        name: "Soil",
        value: "Dark",
        image: "assets/plants/soil.png",
      ),
      PlantPropertyModel(
        name: "AI",
        value: "Yes",
        image: "assets/plants/ai.png",
      ),
    ];

    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/plants/plant1.png"),
              Text(
                "Plant Application",
                style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              Text(
                "Some fake text for this application, now the application is "
                "a1 this is one of the following now there is no",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.aBeeZee(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              // ROW
              SizedBox(
                height: 15,
              ),

              // WEATHER
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.sunny,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text(
                      "14 c",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Multan",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Pakistan",
                          style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // ROW
              SizedBox(
                height: 15,
              ),

              // PROPERTIES
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: plantProperties.length,
                // Adjusted itemCount to 6
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var plantProperty = plantProperties[index];

                  return PlantPropertyItem(
                    name: plantProperty.name,
                    value: plantProperty.value,
                    image: plantProperty.image,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlantPropertyItem extends StatelessWidget {
  final String name;
  final String value;
  final String image;

  PlantPropertyItem(
      {super.key,
      required this.name,
      required this.value,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: Image.asset(this.image, height: 80),
              ),

              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  name,
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
                  value,
                  maxLines: 3,
                  style: GoogleFonts.aBeeZee(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class PlantPropertyModel {
  String name;
  String value;
  String image;

  PlantPropertyModel(
      {required this.name, required this.value, required this.image});
}
