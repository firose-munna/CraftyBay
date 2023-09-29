import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wish List", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
            leading: IconButton(
              onPressed: (){
                Get.find<MainBottomNavController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black,),
            )

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //crossAxisSpacing: 4,
                  mainAxisSpacing: 16
              ),
              itemBuilder: (context, index){
                return const FittedBox(child:  ProductCard());
              }),
        ),
      ),
    );
  }
}
