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

    // with help of LayoutBuild we can get the height and width of the parent Widget through 'constraints'
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Container(
            height: constraints.maxHeight * 0.15,
            // shrinks the text and make it fit in its parent
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
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
            height: constraints.maxHeight * 0.05,
          ),
          Container( height: constraints.maxHeight * 0.15, child: Text(date))
        ],
      );
    });
  }
}
