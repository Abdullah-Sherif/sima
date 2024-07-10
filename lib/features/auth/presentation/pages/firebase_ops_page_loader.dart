import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/barrel.dart';

@RoutePage()
class FirebaseOpsPageLoader extends ConsumerWidget {
  const FirebaseOpsPageLoader({
    @QueryParam() this.mode,
    @QueryParam() this.oobCode,
    @QueryParam() this.apiKey,
    super.key,
  });

  final String? mode;
  final String? oobCode;
  final String? apiKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(firebaseOpsControllerProvider.notifier).initialize(
            mode: mode,
            oobCode: oobCode,
            iKey: apiKey,
          );
    });

    // final currentUser = FirebaseAuth.instance.currentUser;

    switch (mode) {
      // case 'verifyEmail':
      //   return currentUser == null
      //       ? const _Error()
      //       : const ConfirmEmailPage(
      //           verify: true,
      //         );
      case 'resetPassword':
        return const ResetPasswordPage();
      default:
        return const _Error();
    }
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: Text(
              'How did you get here? The link is broken.',
            ),
          ),
        ),
      ),
    );
  }
}
