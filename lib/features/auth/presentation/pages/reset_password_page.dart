import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

String? _getTextFromRetypePasswordError({
  required BuildContext context,
  required RetypeRequiredInputError? error,
}) {
  if (error == null) return null;

  return switch (error) {
    RetypeRequiredInputError.empty => context.appTexts.fieldCantBeEmpty,
    RetypeRequiredInputError.notMatch => context.appTexts.fieldsDontMatch,
  };
}

String? _getTextFromPasswordError({
  required BuildContext context,
  required PasswordInputError? error,
}) {
  if (error == null) return null;

  return switch (error) {
    PasswordInputError.empty => context.appTexts.fieldCantBeEmpty,
  };
}

@RoutePage()
class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();

    final node = FocusScope.of(context);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(resetPasswordProvider.notifier).updateCode(ref.read(firebaseOpsControllerProvider).oobCode!);
        ref.read(resetPasswordProvider.notifier).checkPasswordCode();
      });
      return null;
    }, []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (ref.watch(resetPasswordProvider).checkPasswordCodeStatus) {
          case FetchStatus.failure:
            showSnackbar(
              context: context,
              text: context.appTexts.resetPasswordErrorCode,
            );
            break;
          default:
        }
      });
      return null;
    }, [ref.watch(resetPasswordProvider).checkPasswordCodeStatus]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (ref.watch(resetPasswordProvider).passwordSubmissionStatus) {
          case FetchStatus.success:
            showSnackbar(
              context: context,
              text: context.appTexts.resetPasswordSuccess,
            );
            context.router.replaceAll([
              const AuthWrapperRoute(children: [AuthHomeRoute(), SignInRoute()])
            ]);
            break;
          case FetchStatus.failure:
            showSnackbar(
              context: context,
              text: context.appTexts.resetPasswordError,
            );
            break;
          default:
        }
      });
      return null;
    }, [ref.watch(resetPasswordProvider).passwordSubmissionStatus]);

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
                    context.appTexts.resetPasswordPageMessage,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  const SizedBox(height: 10),
                  CustomTextInput(
                    controller: controller1,
                    hintText: context.appTexts.resetPasswordInput1,
                    isPassword: true,
                    errorMessage: _getTextFromPasswordError(
                      context: context,
                      error: ref.watch(resetPasswordProvider).password1.displayError,
                    ),
                    onChanged: (value) {
                      ref.read(resetPasswordProvider.notifier).password1Changed(value);
                    },
                    onEditingComplete: () => node.nextFocus(),
                  ),
                  const SizedBox(height: 15),
                  CustomTextInput(
                    controller: controller2,
                    hintText: context.appTexts.resetPasswordInput2,
                    isPassword: true,
                    errorMessage: _getTextFromRetypePasswordError(
                      context: context,
                      error: ref.watch(resetPasswordProvider).password2.displayError,
                    ),
                    onChanged: (value) {
                      ref.read(resetPasswordProvider.notifier).password2Changed(value);
                    },
                    onEditingComplete: () => node.unfocus(),
                  ),
                  const SizedBox(height: 25),
                  CustomTextButton(
                    text: context.appTexts.resetPassword,
                    onPressed: () {
                      ref.read(resetPasswordProvider.notifier).resetPassword();
                    },
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
