import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width = 380,
    this.height = 55,
    this.borderRadius = 7,
    this.isLoading = false,
    this.isDisabled = false,
  });

  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final double borderRadius;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isDisabled ? () {} : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          splashFactory: isDisabled ? NoSplash.splashFactory : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: isLoading
            ? SizedBox.square(
                dimension: 20,
                child: CircularProgressIndicator(
                  color: context.theme.colorScheme.background,
                  strokeWidth: 3,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor ?? context.theme.colorScheme.background,
                  fontSize: 20,
                ),
              ),
      ),
    );
  }
}
