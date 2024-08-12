import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/auth/presentation/states/confirm_email_state/confirm_email_state.dart';
import 'package:sima/features/barrel.dart';

@RoutePage()
class ConfirmEmailPage extends HookConsumerWidget {
  const ConfirmEmailPage({super.key, this.verify = false});

  final bool verify;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(confirmEmailControllerProvider.notifier).initialize(FirebaseAuth.instance.currentUser!);
      });
      return null;
    }, []);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (verify) {
          ref.read(confirmEmailControllerProvider.notifier).verifyEmail(ref.read(firebaseOpsControllerProvider).oobCode!);
        } else {
          ref.read(confirmEmailControllerProvider.notifier).sendEmail();
        }
      });
      return null;
    }, []);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (ref.watch(confirmEmailControllerProvider).status) {
          case ConfirmEmailStatus.sendFailure:
            showSnackbar(
              context: context,
              text: context.appTexts.emailSendError,
            );
            break;
          case ConfirmEmailStatus.sent:
            showSnackbar(
              context: context,
              text: context.appTexts.emailSent,
            );
            break;
          case ConfirmEmailStatus.verifyFailure:
            final text = ref.watch(confirmEmailControllerProvider).failure?.mapOrNull(
                      invalidCode: (value) => context.appTexts.invalidCode,
                      expiredCode: (value) => context.appTexts.expiredCode,
                      unknown: (value) => context.appTexts.emailVerifyError,
                    ) ??
                context.appTexts.emailVerifyError;

            showSnackbar(
              context: context,
              text: text,
            );
            context.router.replace(ConfirmEmailRoute());
            break;
          case ConfirmEmailStatus.verified:
            ref.read(authControllerProvider.notifier).setEmailVerified(user: ref.read(userConrollerProvider).user);
            showSnackbar(
              context: context,
              text: context.appTexts.emailVerifiedSuccessfully,
            );
            break;
          default:
        }
      });
      return null;
    }, [ref.watch(confirmEmailControllerProvider).status]);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: context.percentOfSafeHeight(0.06),
          leadingWidth: 130,
          leading: TextButton(
            onPressed: () {
              ref.read(authControllerProvider.notifier).signout();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text(context.appTexts.signout, style: context.textTheme.titleMedium?.copyWith(fontSize: 20)),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
            child: Column(
              children: [
                SizedBox(
                  width: 250,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      context.appTexts.confirmEmail,
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(child: SvgPicture.asset('assets/confirm_light.svg')),
                Text(
                  context.appTexts.checkEmailForLink,
                  style: context.textTheme.titleLarge?.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                Consumer(builder: (context, ref, child) {
                  bool isDisabled = !ref.watch(confirmEmailControllerProvider).isResendEnabled;

                  return CustomTextButton(
                    text: isDisabled
                        ? ref.watch(confirmEmailControllerProvider).timeUntilEnableResend.inSeconds.toString()
                        : context.appTexts.resendEmail,
                    isLoading: ref.watch(confirmEmailControllerProvider).status.isLoading,
                    isDisabled: isDisabled,
                    onPressed: () {
                      ref.read(confirmEmailControllerProvider.notifier).sendEmail();
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
