import 'package:despesaspessoais/components/chart.dart';
import 'package:despesaspessoais/components/transaction_form.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() {
  return runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Montserrat',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            primary: Colors.green,
            brightness: Brightness.light,
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Novo tenis de corrida',
    //   value: 310.76,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Conta de Luz ',
    //   value: 211.30,
    //   date: DateTime.now().subtract(const Duration(days: 2)),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime data) {
    final newTransaction = Transaction(
      id: Random().nextInt(100).toString(),
      title: title,
      value: value,
      date: data,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); // é como se ele voltasse na primeira pagina
  }

  _openTransactionFormMofal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(onSubmit: _addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormMofal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        //faz com que possa rolar a tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(child: Chart(_recentTransaction)),
            const SizedBox(
              height: 20,
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      //é usado pra deixar um botao de icone em baixo
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormMofal(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
