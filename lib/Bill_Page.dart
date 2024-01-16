import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_one/main.dart';

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {

  // String to display cost per person
  String calculatedCost = "0.00";

  // Method to calculate cost per person
  void _calculateCost(){
     setState((){

     });
     // Takes double from each TextField and divides them
     calculatedCost = ((double.parse(priceController.text) / double.parse(peopleController.text))
                        .toStringAsFixed(2));
  }

  // Method to go back to main page
  void _goToHomePage(){
    setState(() {

    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home Page')),
    );
  }

  // Controller to get input from TextFields
  final priceController = TextEditingController();
  final peopleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Background Color
      backgroundColor: const Color(0xff435585),

      body: Column(
        children: [

          // Back Button
          Expanded(
            flex: 8,
            child: Row(
              children: [
                // Back Button
                ElevatedButton(
                  // Method to go back to main page
                    onPressed: () {
                      _goToHomePage();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 20, right: 20)
                    ),

                    child:
                    // Back Button Text and Style
                      const Text("Back",
                          style: TextStyle(
                            fontSize: 20,
                          )
                      ),
                ),
              ],
            ),
          ),

          // Price TextField
          Expanded(
            flex: 23,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  // Price TextField
                  child: TextField(

                    // Price TextField only takes in a number and only 2 decimal places
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                    // Input text
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),

                    // Price TextField Border
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),

                        // '$' prefix and style
                        prefixText: "\$ ",
                        prefixStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),

                        // Text Inside Box and style
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

          // People TextField
          Expanded(
            flex: 23,
              child: Column(
                children: [
                SizedBox(
                  width: 250,

                  // People TextField only takes in whole numbers
                  child: TextField(
                    controller: peopleController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],

                    // Input text
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),

                    // People TextField Border
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),

                        // Filler text to make space even with price input
                        prefixText: "  ",

                        // Text Inside Box and style
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

          // Button to calculate cost
          Expanded(
            flex: 23,
              child: Column(
                children: [
                  ElevatedButton(

                    // Method to calculate cost
                    onPressed: () {
                      _calculateCost();
                      },

                    // Button style
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20)
                    ),

                    // Button text and style
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

          // Text to show cost per person
          Expanded(
            flex: 23,
            child: Column(
                children: [

                  // 'Cost per person' text and style
                  const Text('Cost per person',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25
                    ),),

                  // Cost from calculation
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
