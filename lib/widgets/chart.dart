import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({@required this.recentTransactions});

  List<Map<String, Object>> get _groupedTransactionList {
    return List.generate(7, (int index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        // DateFotmat.E() gives weekdays in String
        "day": DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    });
  }

  double get _totalSpending {
    double sum = 0.0;
    for (var trx in _groupedTransactionList) {
      sum += trx['amount'];
    }
    return sum;
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _groupedTransactionList.map((trx) {
              // in Flexible we can define 'flex'
              // we can also use Expanded in place of Flexible with fit: FlexFit.tight
              return Flexible(
                // the child forces to fill in the avaible place
                fit: FlexFit.tight,
                child: ChartBar(
                  date: trx['day'],
                  spendingAmount: trx['amount'],
                  spendingPrcOfTotal: _totalSpending == 0.0
                      ? 0.0
                      : (trx['amount'] as double) / _totalSpending,
                ),
              );
            }).toList()),
      ),
    );
  }
}
