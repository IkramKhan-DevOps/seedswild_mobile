import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/plant_detail_model.dart';

class PlantAlertWidget extends StatelessWidget {
  final List<Alert> alerts;

  PlantAlertWidget({required this.alerts, super.key});

  @override
  Widget build(BuildContext context) {

    Image getImage(String title){
      String image_name = "";

      switch (title){
        case "heat":
          image_name = "assets/plants/heat.png";
          break;

        case "water":
          image_name = "assets/plants/watering.png";
          break;

        case "cultivation":
          image_name = "assets/plants/cultivation.png";
          break;

        default:
          image_name = "assets/plants/core.png";
      }
      return Image.asset(image_name, height: 60);
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
                      "Alerts AI",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Alerts are generated from Seedswild AI",
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
          child: alerts.length > 0 ? ListView.builder(
            itemCount: alerts.length,
            itemBuilder: (context, index) {
              var item = alerts[index];

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
                    child: getImage(item.alertType),
                  ),
                  title: Text(
                    item.alertType,
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.alertMessage,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              );
            },
          ): Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Alerts feature will be available soon",
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


class PlantsAlertsModel{

  String name;
  String description;
  String image;

  PlantsAlertsModel({required this.name, required this.description, required this.image});

}
