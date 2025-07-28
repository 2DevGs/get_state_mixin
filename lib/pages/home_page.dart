import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cep_model.dart';
import 'home_controller_state_mixin.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeControllerStateMixin>();

  HomePage({super.key});

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
              TextFormField(
                onChanged: ((value) {
                  controller.cepSearch = value;
                }),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.findAddress();
                },
                child: const Text('Buscar'),
              ),
              const SizedBox(
                height: 20,
              ),
              controller.obx(
                (state) => CepWidget(state),
                onEmpty: const Text('Nenhum CEP encontrado'),
                onLoading: const Text('Carregando'),
                onError: (error) => const Text(
                  'Erro ao buscar CEP',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              // Obx(
              //   () {
              //     return Visibility(
              //       visible: controller.loading,
              //       child: const Center(
              //         child: CircularProgressIndicator(),
              //       ),
              //     );
              //   },
              // ),
              // Obx(
              //   () => Visibility(
              //     visible: controller.isError,
              //     child: const Text('Erro ao buscar CEP'),
              //   ),
              // ),
              // Obx(
              //   () {
              //     return Visibility(
              //       visible: !controller.loading,
              //       child: CepWidget(controller.cep),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CepWidget extends StatelessWidget {
  final CepModel? cepModel;

  const CepWidget(this.cepModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CEP: ${cepModel?.cep ?? ''}'),
        Text('Cidade: ${cepModel?.localidade ?? ''}'),
        Text('Rua: ${cepModel?.logradouro ?? ''}'),
        Text('UF: ${cepModel?.uf ?? ''}'),
      ],
    );
  }
}
