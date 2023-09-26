import 'package:craftybay/presentation/ui/screens/home_screen.dart';
import 'package:craftybay/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  int _selecetedIndex =0;

  final List<Widget> _screen = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selecetedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selecetedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 4,
        onTap: (int index){
          _selecetedIndex = index;
          if(mounted){
            setState(() { });
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.shop_outlined), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard_outlined),label: "Wishlist"),
        ],
      ),
    );
  }
}
