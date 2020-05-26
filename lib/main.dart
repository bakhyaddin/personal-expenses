import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/transactions_list.dart';
import './widgets/user_input.dart';
import './widgets/chart.dart';

import './models/transaction.dart';

void main() {
  // this makes sure the orientation settings work properly in every device
  WidgetsFlutterBinding.ensureInitialized();
  // setting up orientatios
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]);
  runApp(PersonalExpenses());
}

class PersonalExpenses extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        // brightness: Brightness.dark,
        fontFamily: 'Quicksand',

        // defining global text style for "title"
        textTheme: TextTheme(
            title: TextStyle(fontFamily: "OpenSans"),
            button: TextStyle(color: Colors.white)),

        // defining test style for appbar's "title"
        appBarTheme: AppBarTheme(
          textTheme:
              TextTheme(title: TextStyle(fontFamily: "OpenSans", fontSize: 25)),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    new Transaction(
        id: "1", title: "Books", amount: 20.50, date: DateTime.now()),
    new Transaction(
        id: "2", title: "Shoes", amount: 35.20, date: DateTime.now()),
  ];

  bool _showChart = false;

  void _addNewTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(new Transaction(
          id: DateTime.now().toString(),
          title: title,
          amount: amount,
          date: date));
    });
  }

  void _openNewTransactionModal() {
    //to build a Bottom Modal
    showModalBottomSheet(
      //context is avaible because context is already given automatically since it is a StatefulWideget class
      //no need to pass a context object
      //normally it takes "Builcontext" Object
      context: context,
      builder: (_) {
        // GestureDetector is responsible for dectecting actions on its child widget
        // here the bottomModal is being closed after saving a new transaction.
        return GestureDetector(
          onTap: () {},
          child: UserInput(
              addNewTransaction: (title, amount, date) =>
                  _addNewTransaction(title, amount, date)),
        );
      },
    );
  }

  void _deleteTransaction(int index) {
    setState(() {
      _transactions.removeAt(index);
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((el) {
      return el.date.isAfter(DateTime.now().subtract(new Duration(days: 7)));
    }).toList();
  }

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isPortrait =
        mediaQuery.orientation == Orientation.portrait;
    final appBar = AppBar(
      title: Text("Personal Expenses"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openNewTransactionModal(),
        )
      ],
    );

    final transactionsList = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.75,
      child: TransactionsList(
        transactions: _transactions,
        deleteTransaction: (index) => _deleteTransaction(index),
      ),
    );
    return Scaffold(
      appBar: appBar,

      // SingleShildScrollView is added to avoid collusion of the soft keyboard and the widget.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (!isPortrait)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("${_showChart ? "Hide" : "Show"} Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
            if (isPortrait)
              Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.25,
                width: double.infinity,
                // Card takes as much space as its parent Widget.
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              ),
            if (isPortrait) transactionsList,
            if (!isPortrait)
              _showChart
                  ? Container(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      width: double.infinity,
                      // Card takes as much space as its parent Widget.
                      child: Chart(
                        recentTransactions: _recentTransactions,
                      ),
                    )
                  : transactionsList
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openNewTransactionModal(),
      ),
    );
  }
}
