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
  final List<Transaction> _transactions = [];

  bool _showChart = false;

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

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormMofal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => TransactionForm(onSubmit: _addTransaction));
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation ==
        Orientation.landscape; //captura a orientação do telefone

    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
          onPressed: () => _openTransactionFormMofal(context),
          icon: const Icon(Icons.add),
        )
      ],
    );
    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        //faz com que possa rolar a tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Alterar'),
                  Switch(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (_showChart || !isLandscape)
              SizedBox(
                height:
                    isLandscape ? availableHeight * 0.8 : availableHeight * 0.3,
                child: Chart(_recentTransaction),
              ),
            SizedBox(
              height: availableHeight * 0.05,
            ),
            if (!_showChart || !isLandscape)
              SizedBox(
                  height: availableHeight * 0.65,
                  child: TransactionList(_transactions, _removeTransaction)),
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
