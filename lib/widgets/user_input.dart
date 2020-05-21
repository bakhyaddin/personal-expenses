import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  final Function addNewTransaction;
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();

  UserInput({@required this.addNewTransaction});

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleInputController,
              decoration: InputDecoration(
                labelText: ("Title"),
              ),
            ),
            TextField(
              controller: amountInputController,
              decoration: InputDecoration(
                labelText: ('Amount'),
              ),
            ),
            FlatButton(
              textColor: Colors.purple,
              child: Text("Add Transaction"),
              onPressed: () => addNewTransaction(
                  titleInputController.text, amountInputController.text),
            )
          ],
        ),
      ),
    );
  }
}
