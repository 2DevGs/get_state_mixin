import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Endereço por CEP'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Buscar'),
              ),
              const SizedBox(
                 height: 20,
              ),
              const CepWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


class CepWidget extends StatelessWidget {
  const CepWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('CEP: '),
        Text('Cidade: '),
        Text('Rua: '),
        Text('UF: '),
      ],
    );
  }
}