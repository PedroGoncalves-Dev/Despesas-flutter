// Importa o pacote 'material.dart' do Flutter, que fornece widgets e outros recursos para criar aplicativos.
import 'package:flutter/material.dart';

// A função main é o ponto de entrada do aplicativo. Ela chama a função runApp, que executa o aplicativo.
main() {
  // runApp é uma função do Flutter que executa o widget passado como argumento.
  return runApp(const Myhome());
}

// Myhome é uma classe que representa o widget raiz do aplicativo. Ela é uma StatelessWidget, o que significa que não tem estado próprio.
class Myhome extends StatelessWidget {
  const Myhome({super.key});

  // O método build é chamado para construir o widget. Ele deve retornar o widget que será exibido.
  @override
  Widget build(BuildContext context) {
    // MaterialApp é um widget que fornece uma estrutura básica para um aplicativo Material Design.
    return const MaterialApp(
      // O título do aplicativo.
      title: 'Testando app',
      // O widget que será exibido como a tela inicial do aplicativo.
      home: MyApp(),
    );
  }
}

// MyApp é uma classe que representa o widget que será exibido como a tela inicial do aplicativo. Ela é uma StatefulWidget, o que significa que tem estado próprio.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // O método createState é chamado para criar o estado do widget.
  @override
  State<MyApp> createState() {
    // Retorna uma instância da classe _MyAppState, que representa o estado do widget.
    return _MyAppState();
  }
}

// _MyAppState é uma classe que representa o estado do widget MyApp.
class _MyAppState extends State<MyApp> {
  // Uma variável que armazena o estado atual do widget.
  bool _estado = false;

  // Um método que muda o estado do widget.
  void _mudarEstado() {
    // setState é um método que atualiza o estado do widget e reconstrói o widget com o novo estado.
    setState(() {
      // Muda o valor da variável _estado para o oposto do atual.
      _estado = !_estado;
    });
  }

  // O método build é chamado para construir o widget. Ele deve retornar o widget que será exibido.
  @override
  Widget build(BuildContext context) {
    // Scaffold é um widget que fornece uma estrutura básica para uma tela do aplicativo.
    return Scaffold(
      // AppBar é um widget que fornece uma barra de título para a tela.
      appBar: AppBar(
        // O título da barra de título.
        title: const Text('App teste'),
      ),
      // O corpo da tela.
      body: Center(
        // Um widget que centraliza seu filho.
        child: Column(
          // Um widget que exibe seus filhos em uma coluna.
          mainAxisAlignment: MainAxisAlignment.center,
          // Os filhos da coluna.
          children: <Widget>[
            // Um widget que exibe um texto dependendo do estado do widget.
            _estado
                ? const Text('Estado verdadeiro')
                : const Text('Estado falso'),
            // Um widget que adiciona um espaçamento vertical.
            const SizedBox(
              height: 30,
            ),
            // Um botão que muda o estado do widget quando pressionado.
            ElevatedButton(
              onPressed: _mudarEstado,
              child: const Text('Mude o estado'),
            ),
          ],
        ),
      ),
    );
  }
}
