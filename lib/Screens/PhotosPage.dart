import 'package:apicalls/DioClass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/DrawerPage.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<dynamic> _photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhoto();
  }

  void fetchPhoto() async {
    var dio = DioClass.createDio();
    try {
      Response response = await dio.get('/photos');
      setState(() {
      _photos = response.data;

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
              'Photos',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo,
            centerTitle: true),
        drawer: DrawerPage(),
        body: Center(
          child: _photos.isEmpty // Checconst k if photos list is empty
              ? Center(
                  child:
                      CircularProgressIndicator()) // Show loading indicator if posts are empty
              : GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                      20,
                      (index) => Card(
                            child: Stack(
                              children: [
                                Image.network(
                                  '${_photos[index]["url"]}',
                                  width: 250,
                                  height: 300,
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 5,
                                  child: Text(
                                    'AlbumID: ${_photos[index]["albumId"]}',
                                    style: TextStyle(
                                        backgroundColor:
                                            Colors.black12.withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Text(
                                    'Id: ${_photos[index]["id"]}',
                                    style: TextStyle(
                                        backgroundColor:
                                            Colors.black12.withOpacity(0.5),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ))),
        ));
  }
}
