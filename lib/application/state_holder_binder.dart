import 'package:craftybay/presentation/state_holders/email_verification_controller.dart';
import 'package:craftybay/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/state_holders/otp_verification_controller.dart';
import 'package:get/get.dart';

class StateHoldersBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSlidersController());
  }
}
