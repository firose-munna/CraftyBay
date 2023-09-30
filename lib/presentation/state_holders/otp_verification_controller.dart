
import 'package:craftybay/data/models/network_response.dart';
import 'package:craftybay/data/servives/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:craftybay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String get message => _message;

  Future<bool> verifyOtp(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.setAccessToken(response.responseJson?['data']);
      return true;
    } else {
      _message = 'OTP verification failed! Try again';
      return false;
    }
  }
}