import 'dart:async';
import 'package:craftybay/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late ValueNotifier<int> _remainingSeconds;
  late Timer _timer;
  final int seconds = 120;

  final TextEditingController _otpTEController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _remainingSeconds = ValueNotifier(seconds);
    otpTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset(
                    ImagePaths.craftyBayLogoSVG,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Enter OTP Code",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "A 4 digit OTP code has been sent",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Form(
                    key: _formkey,
                    child: PinCodeTextField(
                      controller: _otpTEController,
                      appContext: context,
                      length: 4,
                      autoDisposeControllers: false,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: Colors.grey,
                        selectedColor: AppColors.primaryColor,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {},
                      onChanged: (value) {},
                      beforeTextPaste: (text) {
                        return true;
                      },

                      validator: (String? value){
                        if(value?.isEmpty?? true){
                          return "*Enter OTP code";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<OtpVerificationController>(
                      builder: (controller) {
                        if(controller.otpVerificationInProgress){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if(_formkey.currentState!.validate()){
                              verifyOtp(controller);
                            }
                          },
                          child: const Text("Next"),
                        );
                      }
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),

                  ValueListenableBuilder(
                    valueListenable: _remainingSeconds,
                    builder: (context, second, child) {
                      return Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: theme.textTheme.displaySmall?.copyWith(
                                fontSize: 14,
                              ),
                              children: [
                                const TextSpan(
                                    text: 'This code will expire in '),
                                TextSpan(
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  text: '${second}s',
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: second == seconds
                                  ? theme.primaryColor
                                  : Colors.grey,
                            ),
                            onPressed: () {

                              if (second == seconds) {

                                otpTimer();
                              }
                            },
                            child: const Text('Resend Code'),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void otpTimer() {
    _remainingSeconds = ValueNotifier(seconds);
    setState(() {});
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){

      if(_remainingSeconds.value == 0){
        timer.cancel();
        _remainingSeconds.value = seconds;
      }
      else{
        _remainingSeconds.value--;
      }

    });
  }
  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response = await controller.verifyOtp(widget.email, _otpTEController.text.trim());
    if (response) {
      Get.to(() => const MainBottomNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.message),
          ),
        );
      }
    }
  }
}
