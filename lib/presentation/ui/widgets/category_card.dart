import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)
            ),
            child: const Icon(Icons.shop, size:  40, color: AppColors.primaryColor,),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text("Electronics", style: TextStyle(
              fontSize: 15,
              color: AppColors.primaryColor,
              letterSpacing: 0.4
          ),),


        ],
      ),
    );
  }
}