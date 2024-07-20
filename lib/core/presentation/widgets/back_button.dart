import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        'assets/back_arrow.png',
        scale: 0.75,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
