import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmet/data_layer/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore firestore;
  final UserModel user;
  UserRepository({required this.firestore,required this.user});

  Future<void> addUser()async
  {
   
  }

}
