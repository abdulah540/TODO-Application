import 'package:flutter/material.dart';
import 'package:todo/utilities/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller ;
  VoidCallback onsave;
  VoidCallback oncancel;

  DialogBox({super.key,
  required this.controller,
  required this.onsave,
  required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onsave),
                const SizedBox(width: 8,),
                //cancel button
                MyButton(text: "Cancel", onPressed: oncancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}