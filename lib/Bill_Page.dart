import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_one/main.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {

  String calculatedCost = "0.00";

  void _calculateCost(){
     setState((){

     });
     calculatedCost = ((double.parse(priceController.text) / double.parse(peopleController.text))
                        .toStringAsFixed(2));
  }

  void _goToHomePage(){
    setState(() {

    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home Page')),
    );
  }

  final priceController = TextEditingController();
  final peopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      _goToHomePage();
                    },
                    child:
                    Text("Back",
                        style: TextStyle(
                          fontSize: 10,
                        )
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 23,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixText: "\$",
                        labelText: 'Total Price'
                    ),
                  ),
                ),
              ]
            ),
          ),
          Expanded(
            flex: 23,
              child: Column(
                children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: peopleController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total People'
                    ),
                  ),
                ),
              ]
            ),
          ),
          Expanded(
            flex: 23,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _calculateCost();
                      },
                    child:
                      Text("Calculate Cost",
                      style: TextStyle(
                        fontSize: 25,
                        )
                      ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20)
                    )
                  ),
                ],
              ),
          ),
          Expanded(
            flex: 23,
            child: Column(
                children: [
                  Text('\$' + calculatedCost,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ]
            ),
          ),

        ]
      ),
    );
  }
}
