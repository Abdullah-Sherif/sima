import 'package:flutter/material.dart';

class CustomExpandorButton extends StatelessWidget {
  const CustomExpandorButton({
    super.key,
    required this.isExpanded,
    required this.onExpand,
    this.iconSize,
  });

  final bool isExpanded;
  final Function() onExpand;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isExpanded ? -0.25 : 0.25,
      duration: const Duration(milliseconds: 300),
      child: IconButton(
        iconSize: iconSize ?? 27,
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: onExpand,
      ),
    );
  }
}
