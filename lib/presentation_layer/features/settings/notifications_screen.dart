import 'package:flutter/material.dart';

import '../../../core/utils/color_constant.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // APP BAR
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("Notifications", style: TextStyle(color: Colors.white)),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.mark_chat_read,
                color: Colors.white,
              ),
            ),
          ],
        ),

        // BODY
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            child: ListView.builder(
              itemCount: 100,
              addAutomaticKeepAlives: false,
              cacheExtent: 100,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(15),
                  decoration:
                      BoxDecoration(color: ColorConstant.gray10001, border: Border()),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This is a detailed down notification from server on this screen.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),

                      SizedBox(height: 10),
                      Text(
                        "12 Dec, 2021",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
