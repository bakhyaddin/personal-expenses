import "package:flutter/material.dart";

import "./widgets/input.dart";
import './widgets/transaction_card.dart';

import "./models/transaction.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: "Personal Expenses App",
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.greenAccent,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      home: MyAppHome(),
    ));
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppHomeState();
  }
}

class MyAppHomeState extends State<MyAppHome> {
  final List<Transaction> _trx = [];

  void _addNewTransaction(String title, double amount, DateTime date) {
    Transaction newTrx = new Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(() {
      _trx.add(newTrx);
    });
  }

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return Input((String title, double amount, DateTime date) {
            _addNewTransaction(title, amount, date);
          });
        });
  }

  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openModal(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(),
          TransactionCard(_trx),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openModal(context);
        },
      ),
    ));
  }
}
