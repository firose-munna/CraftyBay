import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
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
                TextFormField(),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){}, child: const Text("Next"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
