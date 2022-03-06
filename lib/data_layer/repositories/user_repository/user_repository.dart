
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmet/data_layer/models/user_model.dart';


part 'user_repo_failures.dart';

class UserRepository {
  final FirebaseFirestore _firestore;
  final UserModel _user;
  UserRepository({FirebaseFirestore? firestore, UserModel? user})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _user = user ?? UserModel.empty;

  Future<void> addUserPersonalData() async {
    try {
      await _firestore.collection('users').doc(_user.id).set(<String, dynamic>{
        'personalData': <String, dynamic>{'email': _user.email, 'id': _user.id}
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

  Future<UserModel> getUserPersonalData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> jsonData =
          await _firestore.collection('users').doc(_user.id).get();
      if (jsonData.data() == null) return UserModel.empty;
      return UserModel(id: jsonData['id'], email: jsonData['email']);
    } catch (_) {
      throw const UserRepoFailures();
    }
  }

}
