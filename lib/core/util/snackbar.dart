import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:sima/core/barrel.dart';

void showSnackbar({
  required BuildContext context,
  required String text,
}) {
  showToast(
    text,
    context: context,
    alignment: Alignment.topCenter,
    backgroundColor: context.theme.colorScheme.background,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
      side: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(milliseconds: 700),
    curve: Curves.fastOutSlowIn,
    reverseCurve: Curves.fastOutSlowIn,
    fullWidth: true,
    textStyle: context.textTheme.titleMedium,
    position: StyledToastPosition.top,
    toastHorizontalMargin: 10,
  );
}
