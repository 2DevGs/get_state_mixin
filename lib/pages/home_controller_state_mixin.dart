
import 'package:get/get.dart';

import '../models/cep_model.dart';
import '../repository/viacep_repository.dart';

class HomeControllerStateMixin extends GetxController with StateMixin<CepModel> {
  
  final ViacepRepository _repository;
  final _cepSearch = ''.obs;

  HomeControllerStateMixin(this._repository);

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  
  @override
  void onReady(){
    change(state, status: RxStatus.empty());
  }

    Future<void> findAddress() async {
    try {
      change(state,status: RxStatus.loading());
      await 2.seconds.delay();
      final cep = await _repository.getCep(_cepSearch.value);
      change(cep, status: RxStatus.success());
    } catch (e) {
      change(state,status: RxStatus.error());
    }
  }

}
