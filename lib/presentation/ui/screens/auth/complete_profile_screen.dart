import 'package:craftybay/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class completeProfileScreen extends StatefulWidget {
  const completeProfileScreen({super.key});

  @override
  State<completeProfileScreen> createState() => _completeProfileScreenState();
}

class _completeProfileScreenState extends State<completeProfileScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [

                    const SizedBox(height: 80,),
                    SvgPicture.asset(ImagePaths.craftyBayLogoSVG, width:  100,),
                    const SizedBox(height: 16,),
                    Text("Complete Profile", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                    ),),
                    const SizedBox(height: 6,),
                    Text("Get started with us with your details", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.grey
                    ),),
                    const SizedBox(height: 22,),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "First Name"
                      ),
                      validator: (String? value){
                        if((value?.isEmpty?? true) || value!.length <= 5){
                          return "*Enter First Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Last Name"
                      ),
                      validator: (String? value){
                        if((value?.isEmpty?? true) || value!.length <= 5){
                          return "*Enter Last Name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Mobile Number"
                      ),
                      validator: (String? value){
                        if((value?.isEmpty?? true) || value!.length <= 5){
                          return "*Enter Mobile Number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "City"
                      ),
                      validator: (String? value){
                        if((value?.isEmpty?? true) || value!.length <= 5){
                          return "*Enter City";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      maxLines: 6,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal:  16),
                          hintText: "Shipping Address"
                      ),
                      validator: (String? value){
                        if((value?.isEmpty?? true) || value!.length <= 5){
                          return "*Enter Shipping Address";
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          if(!_formkey.currentState!.validate()){
                            return;
                          }
                          Get.to(const otpVerificationScreen());

                        }, child: const Text("Complete"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
