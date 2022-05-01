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
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
    TransactionCard(Transaction("XD", 99.99, DateTime.now())),
  ];

  void newTransactionCreated(TransactionCard card) {
    setState(() {
      transactionCards.add(card);
    });
  }
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              NewTransaction(newTransactionCreated),
              SizedBox(
                height: 320,
                child: ListView(children: [
                  ...transactionCards,
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
