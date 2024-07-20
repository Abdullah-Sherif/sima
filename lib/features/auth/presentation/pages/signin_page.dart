import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/barrel.dart';

@RoutePage()
class SignInPage extends HookConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailTextController = useTextEditingController();
    final TextEditingController passwordTextController = useTextEditingController();
    final ScrollController scrollController = useScrollController();

    useEffect(() {
      if (ref.watch(loginControllerProvider).status.isFailure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showSnackbar(context: context, text: 'Invalid email or password');
        });
      }
      return null;
    }, [ref.watch(loginControllerProvider).status.isFailure]);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.percentOfSafeHeight(0.06),
          leading: const CustomBackButton(),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            height: context.percentOfSafeHeight(0.94),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        context.appTexts.welcomeBack,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/welcome_light.svg',
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomTextInput(
                    controller: emailTextController,
                    leadingIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(height: 15),
                  CustomTextInput(
                    controller: passwordTextController,
                    leadingIcon: const Icon(Icons.lock),
                    isPassword: true,
                  ),
                  const ForgetPasswordRedirect(),
                  const SizedBox(height: 20),
                  CustomTextButton(
                    text: context.appTexts.signin,
                    onPressed: () {
                      ref.read(loginControllerProvider.notifier).updateEmail(emailTextController.text);
                      ref.read(loginControllerProvider.notifier).updatePassword(passwordTextController.text);

                      ref.read(loginControllerProvider.notifier).login();
                    },
                    textColor: Theme.of(context).colorScheme.background,
                  ),
                  const SignUpRedirect(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordRedirect extends StatelessWidget {
  const ForgetPasswordRedirect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 350,
        child: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: context.appTexts.forgotPassword,
                style: const TextStyle(
                  color: CustomColors.lightBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.push(const ForgetPasswordRoute());
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpRedirect extends StatelessWidget {
  const SignUpRedirect({
    super.key,
  });

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
                text: "${context.appTexts.authHomeSignUpMessage} ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
              TextSpan(
                text: context.appTexts.signup,
                style: const TextStyle(
                  color: CustomColors.lightBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.router.push(const SignUpRoute());
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
