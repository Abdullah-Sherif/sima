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
    final FocusNode emailFocusNode = useFocusNode();
    final FocusNode passwordFocusNode = useFocusNode();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (MediaQuery.of(context).viewInsets.isNonNegative) {
          if (emailFocusNode.hasFocus) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent - 245);
          } else if (passwordFocusNode.hasFocus) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent - 180);
          }
        }
      });
      return null;
    }, [MediaQuery.of(context).viewInsets.bottom]);

    useEffect(() {
      if (ref.watch(loginControllerProvider).status.isFailure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showSnackbar(context: context, text: 'Invalid email or password');
        });
      }
      return null;
    }, [ref.watch(loginControllerProvider).status.isFailure]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          iconSize: 200,
          icon: Image.asset(
            'assets/back_arrow.png',
            scale: 0.75,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.percentOfWidth(0.75),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    context.appTexts.welcomeBack,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.percentOfHeight(0.02)),
              SizedBox(
                height: context.percentOfHeight(0.35),
                child: SvgPicture.asset(
                  'assets/welcome_light.svg',
                ),
              ),
              SizedBox(height: context.percentOfHeight(0.05)),
              CustomTextInput(
                focusNode: emailFocusNode,
                controller: emailTextController,
                leadingIcon: const Icon(Icons.email),
              ),
              SizedBox(height: context.percentOfHeight(0.02)),
              CustomTextInput(
                focusNode: passwordFocusNode,
                controller: passwordTextController,
                leadingIcon: const Icon(Icons.lock),
                isPassword: true,
              ),
              const ForgetPasswordRedirect(),
              SizedBox(height: context.percentOfHeight(0.02)),
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
      padding: EdgeInsets.symmetric(vertical: context.percentOfHeight(0.018)),
      child: SizedBox(
        width: context.percentOfWidth(0.75),
        child: RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: context.appTexts.forgetPassword,
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
      padding: EdgeInsets.symmetric(vertical: context.percentOfHeight(0.018)),
      child: RichText(
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
    );
  }
}
