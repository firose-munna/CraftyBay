import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onSelected, required this.initialSelected});

  final List<Color> colors;
  final Function(int selectIndex) onSelected;
  final int initialSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _selectedColorIndex = 0;

  @override
  void initState() {
    _selectedColorIndex = widget.initialSelected;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: widget.colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _selectedColorIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
          child: CircleAvatar(
            radius: 18,
            backgroundColor: widget.colors[index],
            child: _selectedColorIndex == index
                ? const Icon(
              Icons.done,
              color: Colors.white,
            )
                : null,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 8,
        );
      },
    );
  }
}