import 'package:flutter/material.dart';

main() {}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Testando app',
      home: MinhaHome(),
    );
  }
}

class MinhaHome extends StatefulWidget {
  const MinhaHome({super.key});

  @override
  State<MinhaHome> createState() {
    return _MinhaHomeState();
  }
}

class _MinhaHomeState extends State<MinhaHome> {
  bool estado = false;

  void _muda() {
    setState(() {
      estado = !estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha home'),
      ),
      body: Container(
        height: 400,
        color: Colors.blue,
        child: Column(
          children: <Widget>[
            const Text('Click para mudar o estado'),
            ElevatedButton(onPressed: _muda, child: const Text('Click aqui'))
          ],
        ),
      ),
    );
  }
}
