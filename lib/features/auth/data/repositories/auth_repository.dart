import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/barrel.dart';
import '../../../user/barrel.dart';
import '../../domain/barrel.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository());
// final authRepositoryStreamProvider = StreamProvider<User?>((ref) {
//   return ref.watch(authRepositoryProvider).userAuthStateChanges;
// });

class AuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Stream<User?> get userAuthStateChanges => auth.authStateChanges();

  String? get userID => auth.currentUser?.uid;

  Future<bool> isUserLoggedIn() async {
    return auth.currentUser != null;
  }

  Future<Either<Failure, Success>> sendResetPassEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<AuthFailure, Success>> confirmResetPassCode(String code) async {
    try {
      await auth.verifyPasswordResetCode(code);
      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'expired-action-code':
          return const Left(AuthFailure.expiredCode());
        default:
          return const Left(AuthFailure.unknown());
      }
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }

  Future<Either<AuthFailure, Success>> resetPassword(String code, String newPassword) async {
    try {
      await auth.confirmPasswordReset(code: code, newPassword: newPassword);
      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return const Left(AuthFailure.invalidPassword());
        default:
          return const Left(AuthFailure.unknown());
      }
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }

  Future<Either<Failure, Success>> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return const Right(Success());
    } catch (e) {
      return const Left(Failure());
    }
  }

  Future<Either<AuthFailure, Success>> createUser(CreateUserParams createUserParams) async {
    try {
      final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: createUserParams.email,
        password: createUserParams.password,
      );

      await firestore.collection(FirebaseCollections.users).doc(userCredential.user!.uid).set(
            SIMAUser(
              email: createUserParams.email,
              uid: userCredential.user!.uid,
            ).toJson()
              ..putIfAbsent(UserFields.createdAt, () => FieldValue.serverTimestamp()),
          );

      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return const Left(AuthFailure.emailInUse());
        case 'weak-password':
          return const Left(AuthFailure.invalidPassword());
        case 'invalid-email':
          return const Left(AuthFailure.invalidEmail());
        default:
          return const Left(AuthFailure.unknown());
      }
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }

  Future<Either<AuthFailure, Success>> sendEmailVerification(User user) async {
    try {
      await user.sendEmailVerification();
      return const Right(Success());
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }

  Future<Either<AuthFailure, Success>> verifyEmail(String code) async {
    try {
      await auth.applyActionCode(code);
      await auth.currentUser?.reload();

      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'expired-action-code':
          return const Left(AuthFailure.expiredCode());
        case 'invalid-action-code':
          return const Left(AuthFailure.invalidCode());
        default:
          return const Left(AuthFailure.unknown());
      }
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }

  Future<bool> isEmailVerified() async {
    await auth.currentUser?.reload();
    return auth.currentUser?.emailVerified ?? false;
  }

  Future<Either<Failure, Success>> signout() async {
    try {
      await auth.signOut();
      return const Right(Success());
    } catch (e) {
      return const Left(Failure());
    }
  }

  Future<Either<AuthFailure, Success>> updatePassword(String newPassword, User user) async {
    try {
      await user.updatePassword(newPassword);
      await auth.currentUser?.reload();

      return const Right(Success());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return const Left(AuthFailure.invalidPassword());
        default:
          return const Left(AuthFailure.unknown());
      }
    } catch (e) {
      return const Left(AuthFailure.unknown());
    }
  }
}
