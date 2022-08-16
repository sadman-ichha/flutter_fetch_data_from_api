import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  DetailsScreen(this.postId, this.id, this.name, this.email, this.body);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("More Info")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 9.0),
            child: Column(
              children: [
                Text("PostId: ${postId.toString()}"),
                SizedBox(height: 8.0),
                Text("Id: ${id.toString()}"),
                SizedBox(height: 8.0),
                Text("Name: ${name!}"),
                SizedBox(height: 8.0),
                Text("Email: ${email!}"),
                SizedBox(height: 15.0),
                Text(
                  "Body: ${body!}",
                  style: TextStyle(fontSize: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
