import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/settings/barrel.dart';

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
class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller1 = useTextEditingController();
    final controller2 = useTextEditingController();

    final node = FocusScope.of(context);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        switch (ref.watch(changePasswordControllerProvider).changePasswordStatus) {
          case FetchStatus.failure:
            showSnackbar(
              context: context,
              text: context.appTexts.errorOccured,
            );
            break;
          case FetchStatus.success:
            showSnackbar(
              context: context,
              text: context.appTexts.passChanged,
            );
            Navigator.of(context).pop();
            break;
          default:
        }
      });
      return null;
    }, [ref.watch(changePasswordControllerProvider).changePasswordStatus]);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: BackButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          ),
          title: Text(
            context.appTexts.changePass,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.percentOfSafeHeight(0.94),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 25),
              child: Column(
                children: [
                  const Spacer(),
                  const SizedBox(height: 10),
                  CustomTextInput(
                    controller: controller1,
                    hintText: context.appTexts.currentPass,
                    isPassword: true,
                    errorMessage: _getTextFromPasswordError(
                      context: context,
                      error: ref.watch(changePasswordControllerProvider).currentPassword.displayError,
                    ),
                    onChanged: (value) {
                      ref.read(changePasswordControllerProvider.notifier).onCurrentPasswordChanged(value);
                    },
                    onEditingComplete: () => node.nextFocus(),
                  ),
                  const SizedBox(height: 15),
                  CustomTextInput(
                    controller: controller2,
                    hintText: context.appTexts.newPass,
                    isPassword: true,
                    errorMessage: _getTextFromPasswordError(
                      context: context,
                      error: ref.watch(changePasswordControllerProvider).newPassword.displayError,
                    ),
                    onChanged: (value) {
                      ref.read(changePasswordControllerProvider.notifier).onNewPasswordChanged(value);
                    },
                    onEditingComplete: () => node.unfocus(),
                  ),
                  const SizedBox(height: 25),
                  CustomTextButton(
                    text: context.appTexts.changePass,
                    onPressed: () {
                      ref.read(changePasswordControllerProvider.notifier).changePassword();
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
