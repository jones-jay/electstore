// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String taskName;
  final bool checkedBox;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  Todotile({super.key,
   required this.taskName, 
   required this.checkedBox,
   required this. onChanged,
   required this.deleteFunction,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:25.0, left:25.0, top: 25.0),
      child: Slidable( 
        endActionPane: ActionPane(
        motion: StretchMotion(), 
        children: [
          SlidableAction(onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade300,
          borderRadius: BorderRadius.circular(12),)
        ],),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
             color: Colors.yellow,
             borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: checkedBox, 
                onChanged: onChanged),
        
              Text(taskName,
              style: TextStyle(
                decoration: checkedBox 
                ? TextDecoration.lineThrough 
                : TextDecoration.none
              ),),
            ],
          ),
        ),
      ),
    );
  }
}