import "package:flutter/material.dart";

class Input extends StatefulWidget {
  final Function addTransaction;
  Input(this.addTransaction);
  @override
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData () {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0){
      return;
    }

    widget.addTransaction(enteredTitle, double.parse(enteredAmount), DateTime.now());

    Navigator.of(context).pop();

  }
  
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: (Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () => submitData(),
            ),
          ],
        )),
      ),
    );
  }
}
