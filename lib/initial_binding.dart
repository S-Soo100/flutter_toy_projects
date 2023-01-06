import 'package:get/get.dart';
import 'package:my_practice_app/controller/app_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(
      AppController(),
      permanent: true,
    );
  }
}
