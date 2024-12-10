import 'package:api/pages/http_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("APi service"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HttpPage();
                  },
                ),
              );
            },
            child:const Text("Network", style: TextStyle(fontSize: 20),),
          ),
        ));
  }
}
