import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 320.0,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (int page, _){
                _selectedSlider.value = page;
              }
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: AppColors.greyShade200Color),
                    alignment: Alignment.center,
                    child: Text(
                      'Image $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),

        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context, value, _){
            List<Widget> list = [];
            for(int i =0; i<5; i++){
              list.add(Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:  Colors.grey),
                    color: value == i ? AppColors.primaryColor : Colors.white
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          }),
        )
      ],
    );
  }
}