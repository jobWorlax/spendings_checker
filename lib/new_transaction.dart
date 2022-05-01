import 'package:flutter/material.dart';
import 'transaction.dart';

class NewTransaction extends StatelessWidget {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final Function(TransactionCard) _newTransactionCreated;

  NewTransaction(this._newTransactionCreated);

  void _createTransactionButtonClick() {
    TransactionCard card = TransactionCard(Transaction(_nameController.text,
        double.parse(_amountController.text), DateTime.now()));
    _newTransactionCreated.call(card);
  }

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
              controller: _nameController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(fontSize: 14),
              ),
              controller: _amountController,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: _createTransactionButtonClick,
              child: const Text(
                "Create",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
