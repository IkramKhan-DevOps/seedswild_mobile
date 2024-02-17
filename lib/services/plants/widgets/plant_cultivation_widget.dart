import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantCultivationWidget extends StatelessWidget {
  const PlantCultivationWidget({super.key});

  @override
  Widget build(BuildContext context) {

    List<PlantsNotificationModel> items = [
      PlantsNotificationModel(name: "Watering", description: "Water every 10 days", image: "assets/plants/water.png"),
      PlantsNotificationModel(name: "Depth", description: "5 Inches of dept required", image: "assets/plants/deep.png"),
      PlantsNotificationModel(name: "Area Required", description: "5 inches of area required", image: "assets/plants/distance.png"),
      PlantsNotificationModel(name: "Fertilization", description: "Urea and Form X is useable ", image: "assets/plants/fertilizer.png"),
      PlantsNotificationModel(name: "Plant Height", description: "Plant will reach 10 cm ", image: "assets/plants/height.png"),
    ];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cultivation AI",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Suggestions are generated from Seedswild AI",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var item = items[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                child: ListTile(
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  style: ListTileStyle.list,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item.image,
                      height: 50,
                    ),
                  ),
                  title: Text(
                    item.name,
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.description,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


class PlantsNotificationModel{

  String name;
  String description;
  String image;

  PlantsNotificationModel({required this.name, required this.description, required this.image});

}
