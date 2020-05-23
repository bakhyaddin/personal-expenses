import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList({@required this.transactions});

  Widget build(BuildContext context) {
    return Container(
      height: 360,
      // We used ListView.builder() in place of Column.
      // We also had to add Container and giving height in order to make it visible. otherwise it takes infinite height
      // this is also true for ListView itself
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return (Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                  ),
                  child: Text(
                    '\$${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      
                      // to referring to the globally created text style
                      style: Theme.of(context).textTheme.title
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
