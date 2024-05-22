import 'dart:io';

import 'package:apicalls/Screens/AlbumPage.dart';
import 'package:apicalls/Screens/PhotosPage.dart';
import 'package:apicalls/Screens/TodosPage.dart';
import 'package:apicalls/Screens/UsersPages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'Models/Post.dart';
import 'Screens/CommentPage.dart';
import 'Screens/PostsPage.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  await Hive.openBox('photosbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        backgroundColor: Colors.deepOrangeAccent,
        useMaterial3: true,
      ),

      home: const PostsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//         title: Text(widget.title, style: const TextStyle(color: Colors.white)),
//       ),
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const PostsPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: const Text("Posts Api",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const CommentPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pinkAccent,
//                   ),
//                   child: const Text("Comments Api",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const AlbumPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amber,
//                   ),
//                   child: const Text("Albums Api",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const PhotosPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                   ),
//                   child: const Text("Photos Api",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => const TodosPage(),
//                     ));
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigoAccent,
//                   ),
//                   child: const Text("Todos Api",
//                       style: TextStyle(fontSize: 20, color: Colors.white)),
//                 )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: SizedBox(
//               width: 300,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => const UsersPage(),
//                   ));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange,
//                 ),
//                 child: const Text("Users Api",
//                     style: TextStyle(fontSize: 20, color: Colors.white)),
//               ),
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
