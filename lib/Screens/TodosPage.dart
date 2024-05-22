import 'package:apicalls/DioClass.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../CommonWidget/DrawerPage.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {

  late List<dynamic> _todos =[];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  void fetchTodo() async {
    var dio = DioClass.createDio();
    try {
      Response response = await dio.get('/posts');
      setState(() {
        _todos = response.data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todos',style: TextStyle(color: Colors.white),),backgroundColor: Colors.indigo,centerTitle: true),
        drawer: DrawerPage(),
        body: Center(
          child:  _todos.isEmpty // Checconst k if todos list is empty
              ? Center(child: CircularProgressIndicator()) // Show loading indicator if posts are empty
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
                        'UserId: ${_todos[index]["userId"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'ID: ${_todos[index]["id"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  title: Text('Title: ${_todos[index]["title"]}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  subtitle: Text('Completed: ${_todos[index]["completed"]}'),
                ),
              );
            },
          ),
        )
    );
  }
}
