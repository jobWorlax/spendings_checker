import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction.dart';

void main() => runApp(
      MaterialApp(
        home: const MyApp(),
      ),
    );

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
      Navigator.of(context).pop();
    });
  }

  void _floatingButtonClick() {
    setState(() {
      NewTransaction newTransaction = NewTransaction(_newTransactionCreated);
      newTransaction.show(context);
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: _floatingButtonClick),
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
    );
  }
}
