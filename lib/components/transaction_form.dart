import 'dart:ffi';

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit});

  _onSubmit() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              onSubmitted: (_) => _onSubmit(),
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: true), //faz com que aceite apenas números
              onSubmitted: (_) =>
                  _onSubmit(), // clickando em ok, ja envia o form
              decoration: const InputDecoration(
                labelText: 'Valor R\$',
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 20),
              child: ElevatedButton(
                onPressed: _onSubmit,
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
