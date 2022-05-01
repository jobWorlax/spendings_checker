import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  static int _lastId = -1;
  late final int _id;
  final String name;
  final double cost;
  final DateTime date;

  Transaction(this.name, this.cost, this.date) {
    ++_lastId;
    _id = _lastId;
  }
}

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;

  TransactionCard(this._transaction);

  String get _formattedCost => _transaction.cost.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        elevation: 3,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Row(children: [
            Container(
              alignment: Alignment.center,
              width: 85,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: const EdgeInsets.all(6),
              child: Text(
                "$_formattedCost \$",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _transaction.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat.yMMMd().format(_transaction.date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
