import 'package:apicalls/DioClass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/DrawerPage.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<dynamic> _users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async{
    var dio = DioClass.createDio();
    try{
      Response response = await dio.get('/users');
      setState(() {
      _users = response.data;

      });

    }catch(e){
      print('Error fetching data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Users',style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,centerTitle: true),
        drawer: const DrawerPage(),
        body: Center(
          child:  _users.isEmpty // Checconst k if users list is empty
              ? Center(child: CircularProgressIndicator()) // Show loading indicator if posts are empty
              : ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(color: Colors.redAccent,Icons.person),
                  title: Text('Name: ${_users[index]["name"]}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('UserName: ${_users[index]["username"]}'),
                      Text('Email: ${_users[index]["email"]}'),
                      Text('Street: ${_users[index]["address"]["street"]}'),
                      Text('Suite: ${_users[index]["address"]["suite"]}'),
                      Text('City: ${_users[index]["address"]["city"]}'),
                      Text('Zipcode: ${_users[index]["address"]["zipcode"]}'),
                      Text('Latitude: ${_users[index]["address"]["geo"]["lat"]}'),
                      Text('Longitude: ${_users[index]["address"]["geo"]["lng"]}'),
                      Text('Phone: ${_users[index]["phone"]}'),
                      Text('WebSite: ${_users[index]["website"]}'),
                      Text('Company Name: ${_users[index]["company"]["name"]}'),
                      Text('Company Catch Phrase: ${_users[index]["company"]["catchPhrase"]}'),
                      Text('Company bs: ${_users[index]["company"]["bs"]}'),
                    ],
                  )
                ),
              );
            },
          ),
        )
    );
  }
}
