import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.action,
    this.title,
    required this.onConfirm,
    this.onCancel,
    this.additionalWarning,
    this.additionalWarningColor,
  });

  final String action;
  final String? title;
  final Function() onConfirm;
  final Function()? onCancel;
  final String? additionalWarning;
  final Color? additionalWarningColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: SizedBox(
            width: context.percentOfWidth(0.8),
            child: Column(
              children: [
                Text(
                  '${context.appTexts.areYouSure} $action${title != null ? " $title" : ''}?',
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                if (additionalWarning != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      additionalWarning!,
                      style: context.textTheme.titleLarge?.copyWith(fontSize: 30, color: additionalWarningColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextButton(
                      text: context.appTexts.cancel,
                      onPressed: () {
                        if (onCancel != null) {
                          onCancel!();
                        }
                        Navigator.of(context).pop();
                      },
                      width: context.percentOfWidth(0.3),
                      height: 50,
                    ),
                    CustomTextButton(
                      text: context.appTexts.confirm,
                      onPressed: () {
                        onConfirm();
                        Navigator.of(context).pop();
                      },
                      width: context.percentOfWidth(0.3),
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
