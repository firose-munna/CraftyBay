import 'package:craftybay/presentation/ui/utility/image_paths.dart';
import 'package:craftybay/presentation/ui/widgets/cicular_icon_button.dart';
import 'package:craftybay/presentation/ui/widgets/home/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(ImagePaths.craftyBayNavLogoSVG),
            const Spacer(),
            CircularIconButton(
              icon: Icons.person_outline,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call_outlined,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_active_outlined,
              onTap: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search_rounded),
                    hintText: "Search",
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeSlider(),


            ],
          ),
        ),
      ),
    );
  }
}



