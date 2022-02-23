import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? name;
  final String? email;
  final String? photo;
  final String? id;

  const UserModel({this.name, this.email, this.photo, required this.id});

  static const UserModel empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  // ignore: always_specify_types
  List<Object?> get props => [email, name, photo, id];
}
