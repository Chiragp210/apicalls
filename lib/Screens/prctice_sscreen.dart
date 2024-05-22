import 'dart:ffi';

import 'package:flutter/material.dart';

class PrecticePage extends StatefulWidget {
  const PrecticePage({super.key});

  @override
  State<PrecticePage> createState() => _PrecticePageState();
}

class _PrecticePageState extends State<PrecticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice '),),
      drawer: Drawer(
        // clipBehavior: ,
        // backgroundColor: ,
        // shape: ,
        // shadowColor: ,
        // surfaceTintColor: ,
        // semanticLabel: ,
        // elevation: ,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Stack(
            children: [],
            // key: ,
            // alignment: ,
            // clipBehavior: Clip.antiAlias,
            // fit: ,
            // textDirection: ,
          ),
ElevatedButton(onPressed: (){

}, child: Text("Alert Box"))
        ],),
      ),
    );
  }

//   Future<void> showAlertDialog(BuildContext context) async {
//      showDialog(context: context, builder: builder)
// }
}
