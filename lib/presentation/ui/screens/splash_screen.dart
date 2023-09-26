
import 'package:craftybay/presentation/ui/screens/home_screen.dart';
import 'package:craftybay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToHomeScreen();
  }

  void goToHomeScreen(){
    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Get.offAll(const MainBottomNavScreen())
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(ImagePaths.craftyBayLogoSVG, width:  100,),
              const Spacer(),
              const CircularProgressIndicator(

              ),
              const SizedBox(height: 16,),
              const Text("Version 1.0.0"),
              const SizedBox(height: 16,),

            ],
          ),
        ),
      ),
    );
  }
}
