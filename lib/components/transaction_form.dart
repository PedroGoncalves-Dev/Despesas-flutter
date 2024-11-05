import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20),
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text(
                  'Nova transação',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
