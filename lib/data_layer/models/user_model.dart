import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? email;
  final String? id;
  final String? profileUrl;

  const UserModel({this.email, required this.id,this.profileUrl});

  static const UserModel empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  // ignore: always_specify_types
  List<Object?> get props => [email, id];
}
