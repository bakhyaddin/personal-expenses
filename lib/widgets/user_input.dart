import 'package:flutter/material.dart';

// THE WHOLE WIDGET TRANSFORMED TO A STATEFULWIDGET BECAUSE THE INPUT DATA WAS LOST IN main.dart

class UserInput extends StatefulWidget {
  // the constructor needed to be build in here
  final Function addNewTransaction;
  UserInput({@required this.addNewTransaction});

  @override
  State<StatefulWidget> createState() {
    return _UserInputState();
  }
}

class _UserInputState extends State<UserInput>{
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();


  void saveChanges() {
    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    // it is the way to access of StatefulWidget class's property from the State class.
    widget.addNewTransaction(title, amount);

    // it closses the top most widget which is the bottom modal in our case
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleInputController,
              onSubmitted: (_) => saveChanges(),
              decoration: InputDecoration(
                labelText: ("Title"),
              ),
            ),
            TextField(
              controller: amountInputController,
              onSubmitted: (_) => saveChanges(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: ('Amount'),
              ),
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text("Add Transaction"),
              onPressed: () => saveChanges(),
            )
          ],
        ),
      ),
    );
  }
}
