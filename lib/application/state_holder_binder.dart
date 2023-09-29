import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class StateHoldersBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
