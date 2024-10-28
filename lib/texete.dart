import 'package:flutter/material.dart';

main() {
  return runApp(const Myapp2());
}

class Myapp2 extends StatelessWidget {
  const Myapp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App teste',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Myhome2(),
    );
  }
}

class Myhome2 extends StatefulWidget {
  const Myhome2({super.key});

  @override
  State<Myhome2> createState() {
    // TODO: implement createState
    return _MyhomeState2();
  }
}

class _MyhomeState2 extends State<Myhome2> {
  int numero = 0;

  void _aumentarNumero() {
    setState(() {
      numero++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ola'),
      ),
      body: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))]),
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Column(
              children: [
                const Text('Adicionando numeros'),
                Text(numero.toString()),
                ElevatedButton(
                    onPressed: _aumentarNumero,
                    child: const Text('Aumentar contador')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
