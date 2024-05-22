
import 'package:apicalls/CommonWidget/DrawerPage.dart';
import 'package:apicalls/DioClass.dart';
import 'package:apicalls/Models/Post.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> _posts = [];
  var box = Hive.box('photosbox');
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var dio = DioClass.createDio();
    try {
      Response response = await dio.get('/posts');
      for(var data in response.data) {
        box.add(Post.fromJson(data));
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
    setState(() {
      _posts = box.values.cast<Post>().toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Posts',style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,centerTitle: true),
      drawer: const DrawerPage(),
      body: Center(
          child:  _posts.isEmpty // Checconst k if posts list is empty
              ? const Center(child: CircularProgressIndicator()) // Show loading indicator if posts are empty
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
                        'UserId: ${_posts[index].userId}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'ID: ${_posts[index].id}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  title: Text('Title: ${_posts[index].title}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  subtitle: Text('Body: ${_posts[index].body}'),
                ),
              );
            },
          ),
      )
    );
  }
}
