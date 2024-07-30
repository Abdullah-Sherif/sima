import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.borderColor,
    this.borderWidth,
    this.isLoading = false,
    this.isDisabled = false,
    this.svgPath,
    this.svgWidth,
    this.svgHeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.textSize,
    this.wordSpacing,
  });

  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double width;
  final double height;
  final double borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final bool isLoading;
  final bool isDisabled;
  final String? svgPath;
  final double? svgWidth;
  final double? svgHeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? textSize;
  final double? wordSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: isDisabled || isLoading ? () {} : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          splashFactory: isDisabled ? NoSplash.splashFactory : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 0,
              ),
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
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 0,
                  vertical: verticalPadding ?? 0,
                ),
                child: Column(
                  mainAxisAlignment: svgPath != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: TextStyle(
                          color: textColor ?? context.theme.colorScheme.background,
                          fontSize: textSize ?? 20,
                          wordSpacing: wordSpacing,
                        ),
                      ),
                    ),
                    if (svgPath != null)
                      SvgPicture.asset(
                        svgPath!,
                        width: svgWidth ?? 20,
                        height: svgWidth ?? 20,
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
