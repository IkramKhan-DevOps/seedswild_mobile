import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:seedswild/core/app_export.dart';
import 'package:seedswild/core/constants/colors.dart';
import 'package:seedswild/data_layer/error_handling/app_errors.dart';
import 'package:seedswild/services/plants/providers/plants_provider.dart';
import 'package:seedswild/services/plants/models/plants_model.dart';
import 'package:seedswild/widgets/progress.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/empty.dart';
import '../home/home_page.dart';

class ListItem {
  String title;
  String subtitle;
  String image;
  bool isCheck;

  ListItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.isCheck,
  });
}

class PlantsListScreen extends StatelessWidget {
  const PlantsListScreen({Key? key}) : super(key: key);

  _launchURL(link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {

    List<ListItem> items = [
      ListItem(
        title: "Corn",
        image: "plant1.png",
        subtitle: "category_name  |  AI: Yes",
        isCheck: true,
      ),
      ListItem(
        title: "Rice",
        image: "plant2.png",
        subtitle: "category_name  |  AI: Yes",
        isCheck: false,
      ),
      ListItem(
        title: "Bambos",
        image: "plant3.png",
        subtitle: "category_name  |  AI: Yes",
        isCheck: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: SeedsColor.primary,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );
          },
          child: Icon(
            Icons.dashboard_customize_outlined,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: SeedsColor.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/plants/g1.png", height: 80),
                      Text(
                        "Garden",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Your Virtual garden from seedswild",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // WEATHER
            // WeatherContainer(
            //   icon: Icons.sunny,
            //   temperature: "14 c",
            //   city: "Mansehra",
            //   country: "Pakistan",
            // ),

            // LIST
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
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
                                  "Your Plants",
                                  style: GoogleFonts.lato(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "To register new plant login with web.",
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                _launchURL('https://alpha.seedswild.com/plantation/plant/create/');
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future:
                            Provider.of<PlantsProvider>(context, listen: false)
                                .getPlantsAPI(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ProgressCircular();
                          } else if (snapshot.hasError) {
                            return EmptyData(title: snapshot.error.toString());
                          } else {
                            var plants = context.watch<PlantsProvider>().plants;

                            if (plants.length < 1) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  "You didn't added any plants yet, kindly use web to register plants.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            }

                            return ListView.builder(
                              itemCount: plants.length,
                              itemBuilder: (context, index) {
                                PlantModel plant = plants[index];

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
                                      child: Image.network(
                                        plant.image,
                                        height: 50,
                                      ),
                                    ),
                                    title: Text(
                                      plant.name,
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      plant.category.name,
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.plantsDetailScreen,
                                          arguments: "${plant.id}",
                                        );
                                      },
                                      icon: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: SeedsColor.primary,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
