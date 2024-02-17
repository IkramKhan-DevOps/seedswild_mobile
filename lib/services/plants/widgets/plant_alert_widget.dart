import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantAlertWidget extends StatelessWidget {
  const PlantAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {

    List<PlantsAlertsModel> items = [
      PlantsAlertsModel(name: "Heat", description: "Water every 10 days", image: "assets/plants/water.png"),
      PlantsAlertsModel(name: "Rain", description: "5 Inches of dept required", image: "assets/plants/deep.png"),
      PlantsAlertsModel(name: "Danger", description: "5 inches of area required", image: "assets/plants/distance.png"),
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
                      "Alerts AI",
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


class PlantsAlertsModel{

  String name;
  String description;
  String image;

  PlantsAlertsModel({required this.name, required this.description, required this.image});

}
