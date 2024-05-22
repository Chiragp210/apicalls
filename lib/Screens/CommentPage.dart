import 'package:apicalls/DioClass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/DrawerPage.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<dynamic> _comments = [];

  @override
  void initState() {
    super.initState();
    fetchComment();
  }

  //fetching the data in one variable
  void fetchComment() async {
    var dio = DioClass.createDio();
    try {
      Response response = await dio.get('/comments');
      setState(() {
        _comments = response.data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Comments',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo,
            centerTitle: true),
        drawer: DrawerPage(),
        body: _comments.isEmpty
            ? Center(child: CircularProgressIndicator()) //Loading the data
            : ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PostId: ${_comments[index]["postId"]}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'ID: ${_comments[index]["id"]}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${_comments[index]["name"]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              'Email: ${_comments[index]["email"]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ]),
                      subtitle: Text('Body: ${_comments[index]["body"]}'),
                    ),
                  );
                },
              ));
  }
}
