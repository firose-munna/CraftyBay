import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Carts",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Column(
        children: [
           Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (context, index){
                return const CartProductCard();
                }
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "\$240",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    )
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")))
              ],
            ),
          )
        ],
      ),
    );
  }
}


