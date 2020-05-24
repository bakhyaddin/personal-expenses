import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String date;
  final double spendingAmount;
  final spendingPrcOfTotal;

  ChartBar(
      {@required this.date,
      @required this.spendingAmount,
      @required this.spendingPrcOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // shrinks the text and make it fit in its parent
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              // Fractionally sized Widget is crusial when it comes to display something based on PROPORTIONS
              FractionallySizedBox(
                //
                heightFactor: spendingPrcOfTotal,
                //
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(date)
      ],
    );
  }
}
