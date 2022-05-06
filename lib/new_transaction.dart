import 'package:flutter/material.dart';
import 'transaction.dart';

class NewTransaction {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final Function(TransactionCard) _newTransactionCreated;

  NewTransaction(this._newTransactionCreated);

  void _createTransactionButtonClick() {
    TransactionCard card = TransactionCard(
      Transaction(
        _nameController.text,
        double.parse(_amountController.text),
        DateTime.now(),
      ),
    );
    _newTransactionCreated.call(card);
  }

  void show(BuildContext context) => _showModalBottomSheet(context);

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransactionCard(this);
      },
    );
  }
}

class NewTransactionCard extends StatelessWidget {
  NewTransaction newTransaction;
  NewTransactionCard(this.newTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 14),
              ),
              controller: newTransaction._nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(fontSize: 14),
              ),
              controller: newTransaction._amountController,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: newTransaction._createTransactionButtonClick,
              child: const Text(
                "Create",
              ),
            )
          ],
        ),
      ),
    );
  }
}
