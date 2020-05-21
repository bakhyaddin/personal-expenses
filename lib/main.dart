import 'package:flutter/material.dart';

import './transaction.dart';
import './transactions.dart';

void main() {
  runApp(PersonalExpenses());
}

class PersonalExpenses extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    new Transaction(
        id: "1", title: "Books", amount: 20.50, date: DateTime.now()),
    new Transaction(
        id: "2", title: "Shoes", amount: 35.20, date: DateTime.now()),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            // Card takes as much space as its parent Widget.
            child: Card(
              color: Colors.blue,
              child: Text(
                "Sup",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transactions(
            transactions: transactions,
          ),
        ],
      ),
    );
  }
}
