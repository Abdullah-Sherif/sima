import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

@RoutePage()
class ForgetPasswordPage extends HookConsumerWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();

    useEffect(() {
      switch (ref.read(resetPasswordProvider).emailSubmissionStatus) {
        case FetchStatus.success:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbar(
              context: context,
              text: context.appTexts.resetPasswordEmailSent,
            );
          });
          break;
        case FetchStatus.failure:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackbar(
              context: context,
              text: context.appTexts.errorOccured,
            );
          });
          break;
        default:
      }
      return null;
    }, [ref.watch(resetPasswordProvider).emailSubmissionStatus]);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.percentOfSafeHeight(0.06),
          leading: const CustomBackButton(),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.percentOfSafeHeight(0.94),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
              child: Column(
                children: [
                  Text(
                    context.appTexts.forgotPasswordMessage,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/forgot_password.svg',
                    ),
                  ),
                  CustomTextInput(
                    controller: emailController,
                    leadingIcon: const Icon(Icons.email),
                    width: 380,
                  ),
                  const SizedBox(height: 15),
                  CustomTextButton(
                    text: context.appTexts.resetPassword,
                    isLoading: ref.watch(resetPasswordProvider).emailSubmissionStatus == FetchStatus.loading,
                    isDisabled: ref.watch(resetPasswordProvider).emailSubmissionStatus == FetchStatus.success,
                    onPressed: () {
                      ref.read(resetPasswordProvider.notifier).emailChanged(emailController.text);
                      ref.read(resetPasswordProvider.notifier).sendPasswordResetEmail();
                    },
                    textColor: CustomColors.offWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
