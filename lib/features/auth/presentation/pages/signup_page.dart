import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

String? _getTextFromPasswordError({
  required BuildContext context,
  required PasswordInputError? error,
}) {
  if (error == null) return null;

  return switch (error) {
    PasswordInputError.empty => context.appTexts.fieldCantBeEmpty,
  };
}

String? _getTextFromEmailError({
  required BuildContext context,
  required EmailInputError? error,
}) {
  if (error == null) return null;

  return switch (error) {
    EmailInputError.empty => context.appTexts.fieldCantBeEmpty,
  };
}

@RoutePage()
class SignUpPage extends HookConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (ref.watch(signupControllerProvider).signupStatus) {
          case FetchStatus.success:
            showSnackbar(
              context: context,
              text: context.appTexts.registerSuccess,
            );
            break;
          case FetchStatus.failure:
            showSnackbar(
              context: context,
              text: context.appTexts.errorOccured,
            );
            break;
          default:
        }
      });
      return null;
    }, [ref.watch(signupControllerProvider).signupStatus]);

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
                    context.appTexts.register,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    context.appTexts.registerMessage,
                    style: context.textTheme.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  CustomTextInput(
                    controller: emailController,
                    leadingIcon: const Icon(Icons.email),
                    onChanged: (value) {
                      ref.read(signupControllerProvider.notifier).emailChanged(value);
                    },
                    errorMessage: _getTextFromEmailError(
                      context: context,
                      error: ref.watch(signupControllerProvider).email.displayError,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextInput(
                    controller: passwordController,
                    leadingIcon: const Icon(Icons.lock),
                    isPassword: true,
                    onChanged: (value) {
                      ref.read(signupControllerProvider.notifier).passwordChanged(value);
                    },
                    errorMessage: _getTextFromPasswordError(
                      context: context,
                      error: ref.watch(signupControllerProvider).password.displayError,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextButton(
                    text: context.appTexts.continueString,
                    onPressed: () {
                      ref.read(signupControllerProvider.notifier).signup();
                    },
                  ),
                  const _SignInRedirect(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInRedirect extends StatelessWidget {
  const _SignInRedirect();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        width: 370,
        child: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: "${context.appTexts.registerSigninMessage} ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: context.textTheme.bodySmall?.color,
                ),
              ),
              TextSpan(
                text: context.appTexts.signin,
                style: const TextStyle(
                  color: CustomColors.lightBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.push(const SignInRoute());
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
