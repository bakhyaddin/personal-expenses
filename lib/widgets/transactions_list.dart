import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionsList({@required this.transactions, @required this.deleteTransaction});

  Widget build(BuildContext context) {
    return Container(
      height: 360,
      // We used ListView.builder() in place of Column.
      // We also had to add Container and giving height in order to make it visible. otherwise it takes infinite height
      // this is also true for ListView itself
      child: transactions.isEmpty
          // if is empty show an image
          ? Column(
              children: <Widget>[
                Text("No transactions has not added yet!",
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  child: Image.asset("assets/images/waiting.png"),
                ),
              ],
            )
          // if is full, show the transactions
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return (Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(icon: Icon(Icons.delete, color: Theme.of(context).accentColor,), onPressed: () => deleteTransaction(index),),
                  ),
                  //    Row(
                  //   children: <Widget>[
                  //     Container(
                  //       width: 80,
                  //       alignment: Alignment(0.0, 0.0),
                  //       margin:
                  //           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //       padding: EdgeInsets.all(12),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: Theme.of(context).primaryColor, width: 1),
                  //       ),
                  //       child: Text(
                  //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //             color: Theme.of(context).primaryColor,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(transactions[index].title,

                  //             // to referring to the globally created text style
                  //             style: Theme.of(context).textTheme.title),
                  //         Text(
                  //           DateFormat.yMMMd().format(transactions[index].date),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                ));
              },
            ),
    );
  }
}
