import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/plant_detail_model.dart';

class PlantCultivationWidget extends StatelessWidget {
  final Cultivation? cultivation;
  final String fertilizers;

  PlantCultivationWidget({this.cultivation, required this.fertilizers, super.key});

  @override
  Widget build(BuildContext context) {
    List<PlantsNotificationModel> items = [];

    if (cultivation!= null){
       items.add(PlantsNotificationModel(name: "Watering", description: cultivation!.wateringTime, image: "assets/plants/water.png"));
       items.add(PlantsNotificationModel(name: "Depth", description: cultivation!.depth, image: "assets/plants/deep.png"));
       items.add(PlantsNotificationModel(name: "Area Required", description: cultivation!.area, image: "assets/plants/distance.png"));
       items.add(PlantsNotificationModel(name: "Fertilization", description: fertilizers, image: "assets/plants/fertilizer.png"));
       items.add(PlantsNotificationModel(name: "Plant Height", description: cultivation!.height, image: "assets/plants/height.png"));
       items.add(PlantsNotificationModel(name: "Time Period", description: cultivation!.timePeriod, image: "assets/plants/height.png"));
    }

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
                      "Cultivation suggestions are generated from Seedswild AI",
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
          child: items.length > 0
              ? ListView.builder(
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
                )
              : Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "AI isn't connected to this plant, please wait for 1 week or contact administration",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aBeeZee(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class PlantsNotificationModel {
  String name;
  String description;
  String image;

  PlantsNotificationModel(
      {required this.name, required this.description, required this.image});
}
