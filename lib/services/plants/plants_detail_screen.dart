import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seedswild/services/home/home_page.dart';
import 'package:seedswild/services/plants/widgets/plant_alert_widget.dart';
import 'package:seedswild/services/plants/widgets/plant_cultivation_widget.dart';
import 'package:seedswild/services/plants/widgets/plant_detail_widget.dart';

class PlantsDetailScreen extends StatelessWidget {
  const PlantsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[800],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.bar_chart_rounded)),
                Tab(icon: Icon(Icons.token_outlined)),
                Tab(icon: Icon(Icons.notifications_active_outlined)),
                // Add more tabs as needed
              ],
            ),
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
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
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              PlantDetailWidget(),
              PlantCultivationWidget(),
              PlantAlertWidget()
            ],
          ),
        ),
      ),
    );
  }
}
