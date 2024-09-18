// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  // functions to get the weather
 VoidCallback onGetWeather;
 VoidCallback onCancel;
  


 DialogBox({
    super.key,
    required this.controller,
    required this.onGetWeather,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter city name "),
            ),

            // Two buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // get weather button
                MyButton(text: "Get Weather", onPressed:onGetWeather),
               // space between buttons
                const SizedBox(
                  width: 8,
                ),
                // cancel get new weather
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

