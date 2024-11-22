import 'package:despesaspessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
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
                  height: 200, child: Image.asset('assets/images/waiting.png'))
            ],
          )
        : SizedBox(
            height: 300, // Defina a altura desejada
            child: ListView(
              //usado para listas
              children: transactions
                  .map((tr) => Card(
                        elevation: 8,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: FittedBox(child: Text('R\$${tr.value}')),
                            ),
                          ),
                          title: Text(
                            tr.title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                          trailing: IconButton(
                              onPressed: () => onRemove(tr.id),
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 182, 44, 35),
                                size: 30,
                              )),
                        ),
                      ))
                  .toList(),
            ),
          );
  }
}
