import 'package:flutter/material.dart';
import 'package:spendings_checker/new_transaction.dart';
import 'package:spendings_checker/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TransactionCard> transactionCards = [
    TransactionCard(Transaction("XD1", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD2", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD3", 99.99, DateTime.now())),
  ];

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container();
      },
    );
  }

  void _newTransactionCreated(TransactionCard card) {
    setState(() {
      transactionCards.add(card);
    });
  }

  Widget plsJustBuild() {
    return Container();
  }

//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(":D"),
          actions: [
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: const Icon(Icons.add))
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              //NewTransaction(_newTransactionCreated),
              SizedBox(
                height: 320,
                child: ListView(children: [
                  ...transactionCards,
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          //onPressed: () => _startAddNewTransaction(context)
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => plsJustBuild(),
          ),
        ),
      ),
    );
  }
}
