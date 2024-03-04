import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';

import '../../domain/barrel.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepository());

class UserRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final StreamController<SIMAUser?> _userController = StreamController<SIMAUser?>.broadcast();

  StreamSubscription? _userSubscription;

  Stream<SIMAUser?> get onUserChanged => _userController.stream.asBroadcastStream();

  Stream<SIMAUser?> getUser({
    required String uid,
  }) {
    _userSubscription = firebaseFirestore.collection(FirebaseCollections.users).doc(uid).snapshots().listen((event) {
      if (event.exists) {
        _userController.add(SIMAUser.fromJson(event.data()!));
      } else {
        _userController.add(null);
      }
    });

    return _userController.stream;
  }

  Future<Either<Failure, Success>> updateUser({
    required SIMAUser user,
  }) async {
    try {
      await firebaseFirestore.collection(FirebaseCollections.users).doc(user.uid).update(user.toJson());
      return const Right(Success());
    } catch (e) {
      return const Left(Failure());
    }
  }

  void onUnauthenticated() {
    _userSubscription?.cancel();
    _userController.add(null);
  }
}
