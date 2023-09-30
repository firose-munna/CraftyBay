import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:craftybay/presentation/ui/widgets/home/custom_stepper.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image:
                    AssetImage(ImagePaths.craftyBayShoePNG))
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text("Bata Shoe d676277", style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),),
                            const SizedBox(height: 4,),
                            RichText(
                                text: const TextSpan(
                                    style: TextStyle(color: Colors.black54, fontSize: 12),
                                    children: [
                                      TextSpan(text: "Color : Black"),
                                      TextSpan(text: "Size : XL"),
                                    ]
                                )
                            ),
                          ],
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_outlined))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("\$500", style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18
                      ),),
                      CustomStepper(lowerLimit: 1, upperLimit: 20, stepValue: 1, value: 1, onChange: (int value){})
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}