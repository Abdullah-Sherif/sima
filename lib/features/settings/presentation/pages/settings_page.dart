import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
        ),
        title: Text(
          context.appTexts.settings,
          style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.appTexts.appSettings, style: context.textTheme.titleLarge),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WarningDialog(
                            action: context.appTexts.clearAllData.toLowerCase(),
                            additionalWarningColor: Colors.red,
                            additionalWarning: context.appTexts.signoutMessage,
                            onConfirm: () {
                              ref.read(workoutRepositoryProvider).clearAllData();
                              showSnackbar(context: context, text: context.appTexts.dataCleared);
                            },
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(context.appTexts.clearAllData, style: const TextStyle(fontSize: 20, color: Colors.red)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(context.appTexts.accountSettings, style: context.textTheme.titleLarge),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      context.router.push(const ChangePasswordRoute());
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(context.appTexts.changePass, style: context.textTheme.titleSmall?.copyWith(fontSize: 20)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WarningDialog(
                            action: context.appTexts.signout.toLowerCase(),
                            additionalWarningColor: Colors.red,
                            additionalWarning: context.appTexts.signoutMessage,
                            onConfirm: () {
                              ref.read(workoutRepositoryProvider).deleteDataBase();
                              ref.read(authControllerProvider.notifier).signout();
                            },
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(context.appTexts.signout, style: const TextStyle(fontSize: 20, color: Colors.red)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WarningDialog(
                            action: context.appTexts.delete.toLowerCase(),
                            title: context.appTexts.account.toLowerCase(),
                            additionalWarning: context.appTexts.actionIrreversible,
                            additionalWarningColor: Colors.red,
                            onConfirm: () {
                              ref.read(workoutRepositoryProvider).deleteDataBase();
                              ref.read(userConrollerProvider.notifier).deleteUser();
                            },
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text(context.appTexts.deleteAccount, style: const TextStyle(fontSize: 20, color: Colors.red)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(context.appTexts.helpNContact, style: context.textTheme.titleLarge),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text('test@sima.help', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
