
import 'package:get/get.dart';
import 'package:get_state_mixin/pages/home_controller.dart';
import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViacepRepository());
    Get.put(HomeController(Get.find()));
  }
  


}