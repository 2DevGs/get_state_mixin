
import 'package:get/get.dart';

import '../repository/viacep_repository.dart';
import 'home_controller.dart';
import 'home_controller_state_mixin.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViacepRepository());
    Get.put(HomeController(Get.find()));
    Get.put(HomeControllerStateMixin(Get.find()));
  }
  


}