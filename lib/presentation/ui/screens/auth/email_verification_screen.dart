import 'package:craftybay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: [

                  const SizedBox(height: 80,),
                  SvgPicture.asset(ImagePaths.craftyBayLogoSVG, width:  100,),
                  const SizedBox(height: 16,),
                  Text("Welcome Back", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                  ),),
                  const SizedBox(height: 6,),
                  Text("Please Enter Your Email Address", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey
                  ),),
                  const SizedBox(height: 22,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: "Email"
                    ),
                    validator: (String? value){
                      if(value?.isEmpty?? true){
                        return "*Enter email address";
                      }
                      else if(value?.isEmail == false){
                        return "*Enter valid email address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(

                      onPressed: () {
                        if(!_formkey.currentState!.validate()){
                          return;
                        }
                        Get.to(const OtpVerificationScreen());
                      },
                      child: const Text("Next"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
