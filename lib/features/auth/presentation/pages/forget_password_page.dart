import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

@RoutePage()
class ForgetPasswordPage extends ConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: CustomTextButton(
            text: context.appTexts.authHomeSignUpMessage,
            onPressed: () {
              ref.read(resetPasswordProvider.notifier).sendPasswordResetEmail();
            },
          ),
        ),
      ),
    );
  }
}
