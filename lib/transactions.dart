import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactions extends StatelessWidget {
  final List transactions;

  Transactions({@required this.transactions});

  Widget build(BuildContext context) {
    return Column(
      children: (transactions.map((transaction) {
        return (Card(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 1),
                ),
                child: Text(
                  '\$${transaction.amount}',
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    transaction.title,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transaction.date),
                  ),
                ],
              ),
            ],
          ),
        ));
      })).toList(),
    );
  }
}
