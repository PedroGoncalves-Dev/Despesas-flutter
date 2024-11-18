import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm({required this.onSubmit});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  DateTime? _selectedDate;

  _onSubmit() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  _showDateModal() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : DateFormat('dd MMM y')
                              .format(_selectedDate as DateTime),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _showDateModal,
                    child: const Text(
                      'Selecionar data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FilledButton(
                onPressed: _onSubmit,
                child: const Text(
                  'Nova transação',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
