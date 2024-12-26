// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:to/util/my_buttons.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  
  VoidCallback Save;
  VoidCallback Cancel;

  Dialogbox({super.key, 
  required this.controller,
  required this.Save,
  required this.Cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container( 
        height: 120,

        child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField( 
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Add task...',
                border: OutlineInputBorder(),
              ),
            ),

            // Buttons
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButtons(
                  onPressed: Save, 
                  text: 'Save'),

                  const SizedBox( width: 20),
                 
                  MyButtons(
                  onPressed: Cancel, 
                  text: 'Cancel')
              ],
            )
          ],
        ),

      ),
    );
  }
}