import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class _UserInputState extends State<UserInput> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();
  DateTime _selectedDate;

  void saveChanges() {
    if(_amountInputController.text.toString().isEmpty){
      return;
    }

    final title = _titleInputController.text;
    final amount = double.parse(_amountInputController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }
    // it is the way to access of StatefulWidget class's property from the State class.
    widget.addNewTransaction(title, amount, _selectedDate);

    // it closses the top most widget which is the bottom modal in our case
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleInputController,
              onSubmitted: (_) => saveChanges(),
              decoration: InputDecoration(
                labelText: ("Title"),
              ),
            ),
            TextField(
              controller: _amountInputController,
              onSubmitted: (_) => saveChanges(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: ('Amount'),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      _selectedDate != null
                          ? DateFormat.yMd().format(_selectedDate)
                          : "No date chosen",
                      style: TextStyle(fontSize: 15)),
                  FlatButton(
                    child: Text(
                      "Choose date",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: _openDatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Add Transaction",
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () => saveChanges(),
            )
          ],
        ),
      ),
    );
  }
}
