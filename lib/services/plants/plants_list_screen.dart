import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListItem {
  String title;
  String subtitle;
  bool isCheck;

  ListItem({
    required this.title,
    required this.subtitle,
    required this.isCheck,
  });
}

class PlantsListScreen extends StatelessWidget {
  const PlantsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ListItem> items = [
      ListItem(
          title: "Corn",
          subtitle: "{h:10 w:40} - 20:46 pm",
          isCheck: true),
      ListItem(
          title: "Rice",
          subtitle: "{h:10 w:40} - 20:46 pm",
          isCheck: false),
      ListItem(
          title: "Bambos",
          subtitle: "{h:10 w:40} - 20:46 pm",
          isCheck: true),
      ListItem(title: "--", subtitle: "{h:10 w:40} - 20:46 pm", isCheck: false),
    ];

    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.energy_savings_leaf,
                        color: Colors.white,
                        size: 80,
                      ),
                      Text(
                        "Virtual Garden",
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

            // WEATHER
            Container(
              margin: EdgeInsets.all(20),
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
                            fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),

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
                                  "You have plants these plants upto now",
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          ListItem item = items[index];
                          IconData icon =
                              item.isCheck ? Icons.check : Icons.close;
                          Color color =
                              item.isCheck ? Colors.green : Colors.redAccent;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: ListTile(
                              dense: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              style: ListTileStyle.list,
                              leading: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.handshake_outlined,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              title: Text(
                                item.title,
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                item.subtitle,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  icon,
                                  color: color,
                                ),
                              ),
                            ),
                          );
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
