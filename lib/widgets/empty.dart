import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String? title;

  EmptyData({this.title = "No data available for now."});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/animations/nodata.gif", width: 200, height: 200),
          Text(
            title.toString(),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.redAccent,
              fontSize: 24
            ),
          ),
        ],
      ),
    );
  }
}
