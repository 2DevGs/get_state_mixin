
import 'package:get/get.dart';
import 'package:get_state_mixin/pages/home_super_controller.dart';

import '../repository/viacep_repository.dart';
import 'home_controller.dart';
import 'home_controller_state_mixin.dart';

class HomeBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ViacepRepository());
    Get.put(HomeController(Get.find()));
    Get.put(HomeControllerStateMixin(Get.find()));
    Get.put(HomeSuperController(Get.find()));
  }
  


}