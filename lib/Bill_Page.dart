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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
    );
  }

  final priceController = TextEditingController();
  final peopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff435585),
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
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 20, right: 20)
                    ),
                    child:
                      const Text("Back",
                          style: TextStyle(
                            fontSize: 20,
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),

                        prefixText: "\$ ",
                        prefixStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),

                        labelText: 'Total Price',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25
                        )
                    ),
                    //style:
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),

                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),

                        prefixText: "  ",
                        labelText: 'Total People',
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 25
                        )
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
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20)
                    ),
                    child:
                      const Text("Calculate Cost",
                      style: TextStyle(
                        fontSize: 25,
                        )
                      ),
                    ),
                ],
              ),
          ),
          Expanded(
            flex: 23,
            child: Column(
                children: [
                  const Text('Cost per person',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),),

                  Text('\$' + calculatedCost,
                    style: const TextStyle(
                      color: Colors.white,
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
