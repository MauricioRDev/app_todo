import 'package:flutter/material.dart';

class Ballcolors extends StatelessWidget {
  final Color color;
  const Ballcolors({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color.withOpacity(1),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
