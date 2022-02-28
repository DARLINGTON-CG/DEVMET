import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmet/data_layer/models/user_model.dart';
import 'package:flutter/foundation.dart';

part 'user_repo_failures.dart';

class UserRepository {
  final FirebaseFirestore firestore;
  final UserModel user;
  UserRepository({required this.firestore, required this.user});

  Future<void> addUserPersonalData() async {
    try {
      await firestore.collection('users').doc(user.id).set(<String, dynamic>{
        'personalData': <String, dynamic>{'email': user.email, 'id': user.id}
      });
    } on FirebaseException catch (e) {
      throw UserRepoFailures.fromCode(e.toString());
    } catch (_) {
      throw const UserRepoFailures();
    }
  }

  // Future <void> updateUserPersonalData() async
  // {

  // }

  // Future<void> deleteUserPersonalData() async
  // {

  // }

  Future<void> getUserPersonalData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> jsonData =
          await firestore.collection('users').doc(user.id).get();
      if (kDebugMode) {
        print(jsonData.data().toString());
      }
    } catch (_) {
      throw const UserRepoFailures();
    }
  }
}
