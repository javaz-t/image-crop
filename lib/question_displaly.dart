
import 'package:flutter/material.dart';
import 'package:pic/my_home.dart';

class QuestionDisplay extends StatelessWidget {
  QuestionDisplay(this.question,{super.key});
String question;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,width: 250,
        padding: EdgeInsets.all(30.0), // Optional: Adjust padding as needed
    color: Colors.lightBlue, // Optional: Set background color as needed
    child: Text('${question}',
    style: const TextStyle(
    color: Colors.white, // Optional: Set text color as needed
    fontSize: 24.0, // Optional: Set font size as needed
    fontWeight: FontWeight.bold, // Optional: Set font weight as needed
    ),
    ),
      ),
      ),
    );
  }
}
