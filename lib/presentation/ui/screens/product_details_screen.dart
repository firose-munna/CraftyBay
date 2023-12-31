import 'package:craftybay/presentation/ui/screens/reviews_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/widgets/home/color_picker.dart';
import 'package:craftybay/presentation/ui/widgets/home/custom_stepper.dart';
import 'package:craftybay/presentation/ui/widgets/home/product_image_slider.dart';
import 'package:craftybay/presentation/ui/widgets/home/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
  ];

  int _selectedColorIndex = 0;
  int _selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const ProductImageSlider(),
                        productDetailsAppBar,
                      ],
                    ),
                    productDetails,
                  ],
                ),
              ),
            ),
            addToCartBottomContainer
          ],
        ),
      ),
    );
  }

  Padding get productDetails {
    return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text("Adidas Shoe HK23454 - Balck Edition", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5
                            ),)),
                            CustomStepper(lowerLimit: 1, upperLimit: 10, stepValue: 1, value: 1, onChange: (newValue){})
                          ],
                        ),
                        Row(
                          children: [
                            const Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blueGrey),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to(const ProductReviewsScreen());
                              },
                              child: const Text("Review", style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor),),

                            ),
                            const Card(
                              color: AppColors.primaryColor,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Text("Color", style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, fontWeight: FontWeight.w700
                        ),),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 28,
                          child: ColorPicker(
                              colors: colors,
                              onSelected: (int selectedColor){
                                _selectedColorIndex = selectedColor;
                              },
                              initialSelected: 0),
                        ),
                        const SizedBox(
                          height: 16,
                        ),

                        const Text("Size", style: TextStyle(
                            fontSize: 16,
                            color: Colors.black, fontWeight: FontWeight.w700
                        ),),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 28,
                          child: SizedBox(
                            height: 28,
                            child: SizePicker(
                              initialSelected: 0,
                              onSelected: (int selectedSize) {
                                _selectedSizeIndex = selectedSize;
                              },
                              sizes: sizes,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
                        '''
                        ),
                      ],
                    ),
                  );
  }
  AppBar get productDetailsAppBar {
    return AppBar(
                        leading: const BackButton(
                          color: Colors.black,
                        ),
                        title: const Text("Product Details", style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      );
  }
  Container get addToCartBottomContainer {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16)
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Text("\$240" , style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),)
                  ],
                ),
                SizedBox(
                  width: 120,
                    child: ElevatedButton(onPressed: (){}, child: const Text("Add to Cart")))
              ],
            ),
          );
  }
}


