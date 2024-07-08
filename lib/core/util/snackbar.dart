import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showSnackbar({
  required BuildContext context,
  required String text,
}) {
  showToast(
    text,
    context: context,
    alignment: Alignment.topCenter,
    backgroundColor: Theme.of(context).colorScheme.background,
    shapeBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
      side: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.5,
      ),
    ),
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(milliseconds: 700),
    curve: Curves.fastOutSlowIn,
    reverseCurve: Curves.fastOutSlowIn,
    fullWidth: true,
    textStyle: Theme.of(context).textTheme.titleMedium,
    position: StyledToastPosition.top,
    toastHorizontalMargin: 10,
  );
}
