import 'package:despesaspessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'Nenhuma conta cadastrada',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'))
              ],
            )
          : ListView(
              children: transactions
                  .map((tr) => Card(
                          child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            child: Text(
                              'R\$ ${tr.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tr.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                DateFormat('dd MMM y').format(tr.date),
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ],
                      )))
                  .toList()),
    );
  }
}
