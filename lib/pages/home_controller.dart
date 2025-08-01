
import 'package:get/get.dart';

import '../models/cep_model.dart';
import '../repository/viacep_repository.dart';

class HomeController extends GetxController {

  final ViacepRepository _repository;

  final _cepSearch = ''.obs;
  final _cep = Rxn<CepModel>();
  final _loading = false.obs;
  final _error = false.obs;

  set cepSearch(String cepSearch) => _cepSearch.value = cepSearch;
  CepModel? get cep => _cep.value;
  bool get loading => _loading.value;
  bool get isError => _error.value;

  HomeController(this._repository);

  Future<void> findAddress() async {
    try {
      _error(false);
      _loading(true);
      await 2.seconds.delay();
      final cep = await _repository.getCep(_cepSearch.value);
      _cep(cep);
    } catch (e) {
      _error(true);
    } finally {
      _loading(false);
    }
  }

}