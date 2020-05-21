import 'package:flutter/material.dart';

import './transactions_list.dart';
import './user_input.dart';

import '../models/transaction.dart';

class Transactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionsState();
  }
}

class TransactionsState extends State<StatefulWidget> {
  final List<Transaction> _transactions = [
    new Transaction(
        id: "1", title: "Books", amount: 20.50, date: DateTime.now()),
    new Transaction(
        id: "2", title: "Shoes", amount: 35.20, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, String amount){
    setState(() {
      _transactions.add(new Transaction(id: DateTime.now().toString(), title: title, amount: double.parse(amount), date: new DateTime.now()));
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserInput(addNewTransaction: (title, amount) => _addNewTransaction(title, amount),),
        TransactionsList(transactions: _transactions,),
      ],
    );
  }
}
