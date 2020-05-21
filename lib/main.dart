import 'package:flutter/material.dart';

import './widgets/transactions.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Expenses"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            Transactions(),
          ],
        ),
      ),
    );
  }
}
