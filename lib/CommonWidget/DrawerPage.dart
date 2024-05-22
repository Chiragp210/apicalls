import 'package:apicalls/Screens/AlbumPage.dart';
import 'package:apicalls/Screens/CommentPage.dart';
import 'package:apicalls/Screens/TodosPage.dart';
import 'package:apicalls/Screens/UsersPages.dart';
import 'package:flutter/material.dart';

import '../Screens/PhotosPage.dart';
import '../Screens/PostsPage.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset('assets/Images/virat.jpg',width: 100, // Adjust width and height as needed
                height: 100,
                fit: BoxFit.cover,)),
                  Text('Chirag Panchal',style: TextStyle(fontSize: 20),)
                ],
              ),
            )
        ),
        ListTile(
          title: const Text('Posts',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PostsPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),ListTile(
          title: const Text('Comments',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CommentPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),ListTile(
          title: const Text('Album',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AlbumPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),ListTile(
          title: const Text('Photos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PhotosPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),ListTile(
          title: const Text('Todos',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TodosPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),ListTile(
          title: const Text('Users',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UsersPage(),
                    ));
          },
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ]),
    );
  }
}
