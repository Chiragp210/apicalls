import 'package:apicalls/DioClass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/DrawerPage.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  List<dynamic> _albums = [];

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  void fetchAlbum() async{
    var dio = DioClass.createDio();
    try{
      Response response = await dio.get('/albums');
      setState(() {
        _albums = response.data;
      });
    }catch(e){
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Albums',style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,centerTitle: true),
        drawer: const DrawerPage(),
        body: Center(
          child:  _albums.isEmpty // Checconst list if albums list is empty
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
                        'UserId: ${_albums[index]["userId"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'ID: ${_albums[index]["id"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  title: Text('Title: ${_albums[index]["title"]}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              );
            },
          ),
        )
    );
  }
}
