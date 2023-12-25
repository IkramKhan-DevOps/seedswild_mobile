import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  final String? title;

  EmptyData({this.title = "No data available"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title.toString(),
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
