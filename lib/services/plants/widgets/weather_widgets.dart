import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherContainer extends StatelessWidget {
  final IconData icon;
  final String temperature;
  final String city;
  final String country;

  const WeatherContainer({
    super.key,
    required this.icon,
    required this.temperature,
    required this.city,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.green[700],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          Text(
            temperature,
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                city,
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                ),
              ),
              Text(
                country,
                style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
