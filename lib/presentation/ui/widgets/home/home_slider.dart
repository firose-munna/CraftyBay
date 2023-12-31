import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 150.0,
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

                    decoration: const BoxDecoration(color: AppColors.primaryColor),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),

        const SizedBox(
          height: 8,
        ),

        ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context, value, _){
          List<Widget> list = [];
          for(int i =0; i<5; i++){
            list.add(Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:  Colors.grey),
                  color: value == i ? AppColors.primaryColor : null
              ),
            ));
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          );
        })
      ],
    );
  }
}