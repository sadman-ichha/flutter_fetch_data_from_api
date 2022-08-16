import 'package:flutter/material.dart';
import 'package:flutter_api_integration/views/details_screen.dart';
import '../helper/comments_helper.dart';
import '../model/comments.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Comments>? comments;
  bool isLoaded = false;

  getData() async {
    comments = await CommentsHelper().getComments();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (_, index) {
              return Card(
                elevation: 5.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 17.0,
                    child: Text(comments![index].id.toString()),
                  ),
                  title: Text(comments![index].email),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailsScreen(
                                comments![index].postId,
                                comments![index].id,
                                comments![index].name,
                                comments![index].email,
                                comments![index].body)));
                  },
                ),
              );
            }),
      ),
    );
  }
}
