// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_project_one/Bill_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _goToBillPage(){
    setState(() {

    });
    Navigator.push(
    context,
      MaterialPageRoute(builder: (context) => BillPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 30,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("SplitMyBill",
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                        )
                  ),
                ]
            ),
          ),
          Expanded(
          flex: 70,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.green,
                  foregroundColor:Colors.white,
                  shadowColor: Colors.greenAccent,
                  minimumSize:Size(300, 100),
                  ),
                  onPressed: () {
                    _goToBillPage();
                  },
                  child:
                        Text("Bill",
                            style: TextStyle(
                            fontSize: 40,
                        )
                        ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }

} // Class
