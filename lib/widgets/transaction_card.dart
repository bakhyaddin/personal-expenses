import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionCard(this.transactions);

  // SingleChildScrollView requires a widget to be wrapped with which has height property
  // ListView's height is infinite as long as height property is not defined in Container widget wraps it.
  // ListView is a column with scroll view

  // ListView(children: []) => renders the all children. it is like SingleChildScrollView()
  // ListView.builder() => renders only parts that are shown in the screen
  // both method requires

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: (transactions.length == 0
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions yet!",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20),
                Container(
                  height: 400,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                  elevation: 5,
                  child: (Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  )),
                );
              },
              itemCount: transactions.length,
            )),
    );
  }
}
